package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.PaymentDetailDto;
import com.kh.e3i1.entity.PaymentDto;
import com.kh.e3i1.vo.PaymentListVO;

public interface PaymentDao {
	int sequence();
	void insertPayment(PaymentDto paymentDto);
	List<PaymentDto> list();
	PaymentDto find(int paymentNo);
	
	int insertPaymentDetail(PaymentDetailDto paymentDetailDto);
	List<PaymentDetailDto> listDetail(int paymentNo);
	boolean cancelDetail(PaymentDetailDto paymentDetailDto);
	PaymentDetailDto findDetail(int paymentDetailNo);
	int calculateCancelAmountByJava(int paymentNo);
	int calculateCancelAmountByOracle(int paymentNo);
	
	void cancelAll(int paymentNo);
	
	List<PaymentListVO> treeList();
}
