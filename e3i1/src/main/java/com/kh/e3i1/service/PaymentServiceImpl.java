package com.kh.e3i1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.PaymentDetailDto;
import com.kh.e3i1.entity.PaymentDto;
import com.kh.e3i1.repository.ClubDao;
import com.kh.e3i1.repository.PaymentDao;
import com.kh.e3i1.vo.KakaoPayApproveResponseVO;
import com.kh.e3i1.vo.PurchaseVO;

@Repository
public class PaymentServiceImpl implements PaymentService{

	@Autowired
	private PaymentDao paymentDao;
	
	@Autowired
	private ClubDao clubDao;

//	@Transactional
//	@Override
//	public void insert(int paymentNo, KakaoPayApproveResponseVO responseVO, List<PurchaseVO> purchaseList) {
//		//결제 승인까지 완료된 현 시점에서 결제 정보들을 DB에 저장해야 한다
//		//- PaymentDto : KakaoPayApproveResponseVO에 있는 정보로 등록이 가능
//		//- PaymentDetailDto : 추가 정보가 없다면 등록이 불가능하다
//		PaymentDto paymentDto = PaymentDto.builder()
//													.paymentNo(paymentNo)
//													.paymentTid(responseVO.getTid())
//													.paymentName(responseVO.getItem_name())
//													.paymentTotal(responseVO.getAmount().getTotal())
//												.build();
//		paymentDao.insertPayment(paymentDto);s
//				
//		//purchaseList에 들어있는 상품 번호와 상품 수량을 토대로 상세 정보를 등록
//		for(PurchaseVO purchaseVO : purchaseList) {
//			ClubDto ClubDto = clubDao.find(purchaseVO.getNo());
//			PaymentDetailDto paymentDetailDto = PaymentDetailDto.builder()
//																	.paymentNo(paymentNo)
//																	.paymentDetailName(clubDto.getName())
//																	.paymentDetailPrice(clubDto.getPrice())
//																	.paymentDetailQuantity(purchaseVO.getQuantity())
//																.build();
//			paymentDao.insertPaymentDetail(paymentDetailDto);
//		}
//	}
}
