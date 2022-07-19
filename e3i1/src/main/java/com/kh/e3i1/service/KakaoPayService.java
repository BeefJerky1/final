package com.kh.e3i1.service;

import java.net.URISyntaxException;

import com.kh.e3i1.vo.KakaoPayApproveRequestVO;
import com.kh.e3i1.vo.KakaoPayApproveResponseVO;
import com.kh.e3i1.vo.KakaoPayCancelRequestVO;
import com.kh.e3i1.vo.KakaoPayCancelResponseVO;
import com.kh.e3i1.vo.KakaoPayOrderRequestVO;
import com.kh.e3i1.vo.KakaoPayOrderResponseVO;
import com.kh.e3i1.vo.KakaoPayReadyRequestVO;
import com.kh.e3i1.vo.KakaoPayReadyResponseVO;

public interface KakaoPayService {
	// 결제준비
	KakaoPayReadyResponseVO ready(KakaoPayReadyRequestVO requestVO) throws URISyntaxException;
	// 결제승인 
	KakaoPayApproveResponseVO approve(KakaoPayApproveRequestVO requestVO) throws URISyntaxException;
	// 결제조회
	KakaoPayOrderResponseVO order(KakaoPayOrderRequestVO requestVo) throws URISyntaxException;
	// 결제취소
	KakaoPayCancelResponseVO cancel(KakaoPayCancelRequestVO requestVO) throws URISyntaxException;
}
