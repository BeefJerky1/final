package com.kh.e3i1.service;

import java.util.List;

import com.kh.e3i1.vo.KakaoPayApproveResponseVO;
import com.kh.e3i1.vo.PurchaseVO;

public interface PaymentService {

	void insert(int paymentNo, KakaoPayApproveResponseVO responseVO, List<PurchaseVO> purchaseList);
}
