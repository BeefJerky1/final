package com.kh.e3i1.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.e3i1.vo.KakaoPayApproveRequestVO;
import com.kh.e3i1.vo.KakaoPayApproveResponseVO;
import com.kh.e3i1.vo.KakaoPayCancelRequestVO;
import com.kh.e3i1.vo.KakaoPayCancelResponseVO;
import com.kh.e3i1.vo.KakaoPayOrderRequestVO;
import com.kh.e3i1.vo.KakaoPayOrderResponseVO;
import com.kh.e3i1.vo.KakaoPayReadyRequestVO;
import com.kh.e3i1.vo.KakaoPayReadyResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class KakaoPayServiceVersion1 implements KakaoPayService {
	
	@Value("${pay.autorization}")
	private String autorization1;
	
	private String urlPrefix = "https://kapi.kakao.com/v1/payment";
	
	private RestTemplate template = new RestTemplate();
	
	// Admin키의 경우 노출하지 않게 하기 위해서 properties 파일로 만들어서 분리해둔다. 
	private String authorization = "KakaoAK 41f05d9d3c76c950fdaed5d093ca804a";
	// 다 하고 마지막에 이걸로 바꾸기
//	private String authorization = autorization1;
	private String contentType = "application/x-www-form-urlencoded;charset=utf-8";
	
	private String cid = "TC0ONETIME";

	@Override
	public KakaoPayReadyResponseVO ready(KakaoPayReadyRequestVO requestVO) throws URISyntaxException {
		HttpHeaders headers = new HttpHeaders();
		// headers.add("이름","값");
		headers.add("Authorization", authorization);
		headers.add("Content-type", contentType);
		
		// body
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("cid", cid); // 가맹점 코드 - 가맹을 맺었을 경우 발급되는 코인 / 없는 경우 TC0ONETIME
		body.add("partner_order_id", requestVO.getPartner_order_id()); // 주문번호 - 중복되면 안되기 때문에 시퀀스를 이용하면 된다. / UUID.randomUUID().toString() - 임시로 랜덤 시리얼 번호 사용
		body.add("partner_user_id", requestVO.getPartner_user_id()); // 회원아이디 
		body.add("item_name", requestVO.getItem_name()); // 상품명(최대 100자)
		body.add("quantity", String.valueOf(requestVO.getQuantity())); // 판매수량 - 실제 상품갯수가 아닌 주문갯수라고 생각하면 될듯(ex:묶음으로 구매시 갯수는 4개지만 주문갯수는 1개)
		body.add("total_amount", String.valueOf(requestVO.getTotal_amount())); // 상품 총액
		body.add("tax_free_amount", "0"); // 상품 비과세액(0) - 무조건 0원 
		
//		String prefix = ServletUriComponentsBuilder
//										.fromCurrentContextPath()
//										.path("/pay")
//										.toUriString();
		// 위의 코드는 test할 때 사용할 수 없기 때문에 임시로 아래코드로 사용 
		String prefix = "http://localhost:8080/siso/pay";
		body.add("approval_url", prefix+"/approve"); // 결제 성공시 주소 
		body.add("cancel_url", prefix+"/cancel"); // 결제 취소시 주소
		body.add("fail_url", prefix+"/fail"); // 결제 실패시 주소 
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
		
		URI uri = new URI(urlPrefix+"/ready");

		KakaoPayReadyResponseVO responseVO = template.postForObject(uri, entity, KakaoPayReadyResponseVO.class);
		return responseVO;
	}

	@Override
	public KakaoPayApproveResponseVO approve(KakaoPayApproveRequestVO requestVO) throws URISyntaxException {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", authorization);
		headers.add("Content-type", contentType);

		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("cid", cid);
		body.add("tid", requestVO.getTid()); // 결제요청시의 거래번호
		body.add("partner_order_id", requestVO.getPartner_order_id()); // 결제요청시의 주문번호
		body.add("partner_user_id", requestVO.getPartner_user_id()); // 결제요청시의 회원번호
		body.add("pg_token", requestVO.getPg_token()); // 결제 성공 후 서버에서 반환되는 토큰(Token) 
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
		
		URI uri = new URI(urlPrefix+"/approve");
		
		KakaoPayApproveResponseVO responseVO = template.postForObject(uri, entity, KakaoPayApproveResponseVO.class);
		
		log.debug("tid={}", responseVO.getTid());
		log.debug("partner_order_id={}",responseVO.getPartner_order_id());
		log.debug("partner_user_id={}",responseVO.getPartner_user_id());
		
		return responseVO;
	}

	@Override
	public KakaoPayOrderResponseVO order(KakaoPayOrderRequestVO requestVo) throws URISyntaxException {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", authorization);
		headers.add("Content-type", contentType);
		
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("cid", cid);
		body.add("tid", requestVo.getTid());
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
		
		URI uri = new URI(urlPrefix+"/order");
		
		KakaoPayOrderResponseVO responseVO = template.postForObject(uri, entity, KakaoPayOrderResponseVO.class);
		
		return responseVO;
	}

	@Override
	public KakaoPayCancelResponseVO cancel(KakaoPayCancelRequestVO requestVO) throws URISyntaxException {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", authorization);
		headers.add("Content-type", contentType);
		
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("cid", cid);
		body.add("tid", requestVO.getTid());
		body.add("cancel_amount", String.valueOf(requestVO.getCancel_amount()));
		body.add("cancel_tax_free_amount", "0");
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
		
		URI uri = new URI(urlPrefix+"/cancel");
		
		KakaoPayCancelResponseVO responseVO = template.postForObject(uri, entity, KakaoPayCancelResponseVO.class);
		log.debug("responseVO={}",responseVO);
		
		return responseVO;
	}

}
