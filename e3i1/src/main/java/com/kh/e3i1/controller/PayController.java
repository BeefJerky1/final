package com.kh.e3i1.controller;

import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.e3i1.entity.PaymentDetailDto;
import com.kh.e3i1.entity.PaymentDto;
import com.kh.e3i1.repository.PaymentDao;
import com.kh.e3i1.service.KakaoPayService;
import com.kh.e3i1.service.PaymentService;
import com.kh.e3i1.vo.KakaoPayApproveRequestVO;
import com.kh.e3i1.vo.KakaoPayApproveResponseVO;
import com.kh.e3i1.vo.KakaoPayCancelRequestVO;
import com.kh.e3i1.vo.KakaoPayCancelResponseVO;
import com.kh.e3i1.vo.KakaoPayOrderRequestVO;
import com.kh.e3i1.vo.KakaoPayOrderResponseVO;
import com.kh.e3i1.vo.KakaoPayReadyRequestVO;
import com.kh.e3i1.vo.KakaoPayReadyResponseVO;
import com.kh.e3i1.vo.PurchaseListVO;
import com.kh.e3i1.vo.PurchaseVO;
import com.kh.spring20.entity.ProductDto;
import com.kh.spring20.repository.ProductDao;

@Controller
public class PayController {
	
	@Autowired
	private ClubDao clubDao;
	
	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Autowired
	private PaymentDao paymentDao;
	
	@Autowired
	private PaymentService paymentService;

	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@PostMapping("/pay1_purchase")
	public String pay1Purchase(
				//@RequestParam int no, @RequestParam int quantity
				@ModelAttribute PurchaseVO purchaseVO, HttpSession session
			) throws URISyntaxException {
		
		// 상품가격이 필요 
		// 상품이 없다면 결제가 진행되지 않도록 처리 
		if(productDto == null) {
			return "redirect:pay1_purchase";
		}
		
		//결제 준비(ready) 요청을 진행
		int totalAmount = productDto.getPrice() * purchaseVO.getQuantity();
		int paymentNo = paymentDao.sequence();
		KakaoPayReadyRequestVO requestVO = 
									KakaoPayReadyRequestVO.builder()
												.partner_order_id(String.valueOf(paymentNo))
												.partner_user_id("testuser1")
												.item_name(productDto.getName())
												.quantity(purchaseVO.getQuantity())
												.total_amount(totalAmount)
											.build();
		KakaoPayReadyResponseVO responseVO = kakaoPayService.ready(requestVO);
		
		//결제성공 페이지에서 승인요청을 보내기 위해 알아야할 데이터 3개를 세션에 임시로 추가한다
		//-> 결제가 성공할지 실패할지 취소될지 모르기 때문에 모든 경우에 추가한 데이터를 지워야 한다
		session.setAttribute("pay", KakaoPayApproveRequestVO.builder()
																.tid(responseVO.getTid())
																.partner_order_id(requestVO.getPartner_order_id())
																.partner_user_id(requestVO.getPartner_user_id())
															.build());
		//추가적으로 결제성공 페이지에서 완료정보를 등록하기 위해 알아야 할 상품구매개수 정보를 같이 전달
		//session.setAttribute("purchase", purchaseVO);//상품이 1개라면
		//session.setAttribute("purchase", Arrays.asList(purchaseVO));//1.8부터
		session.setAttribute("purchase", List.of(purchaseVO));//상품이 여러개라면(9부터)
		
		//결제 번호도 세션으로 전달 
		session.setAttribute("paymentNo", paymentNo);
		
		return "redirect:"+responseVO.getNext_redirect_pc_url();
	}
	
	//승인/취소/실패 : 카카오 API에 신청한 URL로 처리
	@GetMapping("/pay/approve")
	public String paySuccess(@RequestParam String pg_token, HttpSession session) throws URISyntaxException {
		//세션에 추가된 정보를 받고 세션에서 삭제한다(tid, partner_order_id, partner_user_id)
		// -> 취소 , 실패 , 성공 모두다 삭제하도록 처리
		KakaoPayApproveRequestVO requestVO = 
									(KakaoPayApproveRequestVO) session.getAttribute("pay");
		session.removeAttribute("pay");
		
		List<PurchaseVO> purchaseList = (List<PurchaseVO>) session.getAttribute("purchase");
		session.removeAttribute("purchase");
		
		int paymentNo = (int) session.getAttribute("paymentNo");
		session.removeAttribute("paymentNo");
		
		//주어진 정보를 토대로 승인(approve) 요청을 보낸다
		requestVO.setPg_token(pg_token);
		KakaoPayApproveResponseVO responseVO = kakaoPayService.approve(requestVO);
		
		paymentService.insert(paymentNo, responseVO, purchaseList);
		
//		return "redirect:/pay/finish";
		return "redirect:finish";
	}
	
	@GetMapping("/pay/finish")
	public String payFinish() {
		return "pay/finish";
	}
	
	@GetMapping("/pay/cancel")
	public String payCancel(HttpSession session) {
		session.removeAttribute("pay");
		session.removeAttribute("purchase");
		session.removeAttribute("paymentNo");
		return "pay/cancel";
	}
	
	@GetMapping("/pay/fail")
	public String payFail(HttpSession session) {
		session.removeAttribute("pay");
		session.removeAttribute("purchase");
		session.removeAttribute("paymentNo");
		return "pay/fail";
	}
	
	@GetMapping("/pay2")
	public String pay2(Model model) {
		model.addAttribute("list",productDao.list());
		return "pay2/list";
	}
	// purchase[0].no=1&purchase[0].quantity=1 형태로 오는 데이터를 수신하기 위한 처리
	@PostMapping("/pay2_purchase")
	public String pay2(
			@ModelAttribute PurchaseListVO listVO,
			HttpSession session) throws URISyntaxException {
		if(listVO == null || listVO.getPurchase() == null) {
			// 상품을 구매한것이 없으므로 차단
			return "redirect:pay2"; // 또는 에러 처리
		}
		
		// listVO의 내용을 토대로 묶음 결제를 준비
		// - 상품명 : 첫번째 상품명 + "외 ?건" 
		// - 총금액 : (상품 가격 * 구매개수) * 종류
		int totalAmount = 0;
		List<String> itemNames = new ArrayList<>();
		for(PurchaseVO purchaseVO : listVO.getPurchase()) {
			ProductDto productDto = productDao.find(purchaseVO.getNo());
			totalAmount += productDto.getPrice() * purchaseVO.getQuantity();// 상품가격 * 구매수량
			itemNames.add(productDto.getName()); // 상품명 
		}
		String itemName = itemNames.get(0);
		if(itemNames.size() >= 2) {
			itemName += "외"+(itemNames.size()-1)+"건";
		}
		
		// 카카오페이 준비 요청
		int paymentNo = paymentDao.sequence();
		KakaoPayReadyRequestVO requestVO = KakaoPayReadyRequestVO.builder()
																.partner_order_id(String.valueOf(paymentNo))
																.partner_user_id("testuser1")
																.item_name(itemName)
																.quantity(1)
																.total_amount(totalAmount)
															.build();
		
		KakaoPayReadyResponseVO responseVO = kakaoPayService.ready(requestVO);
		
		// 세션에 필요한 데이터를 추가
		//결제성공 페이지에서 승인요청을 보내기 위해 알아야할 데이터 3개를 세션에 임시로 추가한다
		//-> 결제가 성공할지 실패할지 취소될지 모르기 때문에 모든 경우에 추가한 데이터를 지워야 한다
		session.setAttribute("pay", KakaoPayApproveRequestVO.builder()
				.tid(responseVO.getTid())
				.partner_order_id(requestVO.getPartner_order_id())
				.partner_user_id(requestVO.getPartner_user_id())
			.build());
		//추가적으로 결제성공 페이지에서 완료정보를 등록하기 위해 알아야 할 상품구매개수 정보를 같이 전달
		//session.setAttribute("purchase", purchaseVO);//상품이 1개라면
		//session.setAttribute("purchase", Arrays.asList(purchaseVO));//1.8부터
		session.setAttribute("purchase", listVO.getPurchase()); // 실제 구매 상품 명단
		
		//결제 번호도 세션으로 전달 
		session.setAttribute("paymentNo", paymentNo);
		
		return "redirect:"+responseVO.getNext_redirect_pc_url();
	}
	
	@GetMapping("/history")
	public String history(Model model) {
		model.addAttribute("list",paymentDao.list());
		return "pay/list";
	}
	
	@GetMapping("/more")
	public String more(@RequestParam int paymentNo, Model model) throws URISyntaxException {
		// view 페이지로 다음 데이터를 전달해야 한다.
		// - 결제대표정보(PaymentDto)
		// - 상세내역(List<PaymentDetailDto>)
		// - 카카오 API 조회내역(KakaoPayOrderResponseVO)을 전달한다.
		PaymentDto paymentDto = paymentDao.find(paymentNo);
		model.addAttribute("paymentDto",paymentDto);
		
		List<PaymentDetailDto> paymentDetailList = paymentDao.listDetail(paymentNo);
		model.addAttribute("paymentDetailList",paymentDetailList);
		
		KakaoPayOrderResponseVO responseVO = kakaoPayService.order(KakaoPayOrderRequestVO.builder()
																						.tid(paymentDto.getPaymentTid())
																					.build());
		model.addAttribute("responseVO",responseVO);
		
		return "pay/more";
	}
	
	@GetMapping("/cancel")
	public String cancelDetail(@RequestParam int paymentDetailNo) throws URISyntaxException {
		// 정보 조회
		PaymentDetailDto paymentDetailDto = paymentDao.findDetail(paymentDetailNo);
		if(paymentDetailDto == null) {
			// 404처리
			// throw new CannotFindException();
		}
		PaymentDto paymentDto = paymentDao.find(paymentDetailDto.getPaymentNo());
		
		// 실제 취소 
		KakaoPayCancelRequestVO requestVO = KakaoPayCancelRequestVO.builder()
																	.tid(paymentDto.getPaymentTid())
//																	.cancel_amount(paymentDetailDto.getPaymentDetailQuantity() * paymentDetailDto.getPaymentDetailPrice())
																	.cancel_amount(paymentDetailDto.getPaymentTotal())
																.build();
		
		KakaoPayCancelResponseVO responseVO = kakaoPayService.cancel(requestVO);
		
		// DB처리
		paymentDao.cancelDetail(paymentDetailDto);
		return "redirect:more?paymentNo="+paymentDetailDto.getPaymentNo();
	}
	
	@GetMapping("/cancel_all")
	public String cancelAll(@RequestParam int paymentNo, RedirectAttributes attr) throws URISyntaxException {
		PaymentDto paymentDto = paymentDao.find(paymentNo);
		if(paymentDto == null) {
			// throw new CannotFindException();
		}
		
		// 결제고유번호에 대한 취소금액을 계산
//		int cancelAmount = paymentDao.calculateCancelAmountByJava(paymentNo);
		int cancelAmount = paymentDao.calculateCancelAmountByOracle(paymentNo);
		if(cancelAmount == 0) { // 금액이 0이라는건 취소할 항목이 없다는 의미
			// 차단
		}
		
		// 카카오페이에 취소 요청
		KakaoPayCancelRequestVO requestVO = KakaoPayCancelRequestVO.builder()
																	.tid(paymentDto.getPaymentTid())
																	.cancel_amount(cancelAmount)
																.build();
		KakaoPayCancelResponseVO responseVO = kakaoPayService.cancel(requestVO);
		
		// 보유 DB의 정보도 수정 처리
		paymentDao.cancelAll(paymentNo);
		
		// return "redirect:more?paymentNo="+paymentNo;
		attr.addAttribute("paymentNo",paymentNo);
		return "redirect:more";
	}
	
	@GetMapping("/history2")
	public String history2(Model model) {
		model.addAttribute("list",paymentDao.treeList());
		return "pay/list2";
	}
}









