package com.kh.e3i1.rest;

import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.e3i1.entity.ClubPlusDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.repository.ClubDao;
import com.kh.e3i1.repository.ClubPlusDao;
import com.kh.e3i1.repository.MemberDao;
import com.kh.e3i1.repository.PaymentDao;
import com.kh.e3i1.service.KakaoPayService;
import com.kh.e3i1.service.PaymentService;
import com.kh.e3i1.vo.KakaoPayApproveRequestVO;
import com.kh.e3i1.vo.KakaoPayReadyRequestVO;
import com.kh.e3i1.vo.KakaoPayReadyResponseVO;
import com.kh.e3i1.vo.PurchaseListVO;
import com.kh.e3i1.vo.PurchaseVO;

@CrossOrigin(
		origins = {"http://127.0.0.1:5500"}
	)
@RestController
@RequestMapping("/rest/pay")
public class PayRestController {
	@Autowired
	private ClubDao clubDao;
	
	@Autowired
	private ClubPlusDao clubPlusDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Autowired
	private PaymentDao paymentDao;
	
	@Autowired
	private PaymentService paymentService;
	
	// purchase[0].no=1&purchase[0].quantity=1 형태로 오는 데이터를 수신하기 위한 처리
	@PostMapping("/pay_purchase")
	public String pay(
			@RequestParam int clubNo,
			@ModelAttribute PurchaseListVO listVO,
			HttpSession session) throws URISyntaxException {
		if(listVO == null || listVO.getPurchase() == null) {
			// 상품을 구매한것이 없으므로 차단
			return "redirect:pay"; // 또는 에러 처리
		}
			
		// listVO의 내용을 토대로 묶음 결제를 준비
		// - 상품명 : 첫번째 상품명 + "외 ?건" 
		// - 총금액 : (상품 가격 * 구매개수) * 종류
		int totalAmount = 0;
		List<String> itemNames = new ArrayList<>();
		for(PurchaseVO purchaseVO : listVO.getPurchase()) {
			ClubPlusDto clubPlusDto = clubPlusDao.find(purchaseVO.getClubPlusNo());
				
			totalAmount += clubPlusDto.getClubPlusPrice() * purchaseVO.getQuantity();// 상품가격 * 구매수량
			itemNames.add(clubPlusDto.getClubPlusName()); // 상품명 
		}
		String itemName = itemNames.get(0);
			
		if(itemNames.size() >= 2) {
			itemName += "외"+(itemNames.size()-1)+"건";
		}
			
		// 카카오페이 준비 요청
		int paymentNo = paymentDao.sequence();
		MemberDto memberDto = memberDao.info((Integer)session.getAttribute("login"));
		KakaoPayReadyRequestVO requestVO = KakaoPayReadyRequestVO.builder()
																.partner_order_id(String.valueOf(paymentNo))
																.partner_user_id(memberDto.getMemberEmail())
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

	
}
