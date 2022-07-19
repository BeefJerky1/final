package com.kh.e3i1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.e3i1.entity.PaymentDetailDto;
import com.kh.e3i1.entity.PaymentDto;
import com.kh.e3i1.vo.PaymentListVO;

@Repository
public class PaymentDaoImpl implements PaymentDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int sequence() {
		return sqlSession.selectOne("payment.sequence");
	}
	
	@Override
	public void insertPayment(PaymentDto paymentDto) {
		sqlSession.insert("payment.insert", paymentDto);
	}

	@Override
	public int insertPaymentDetail(PaymentDetailDto paymentDetailDto) {
		int sequence = sqlSession.selectOne("paymentDetail.sequence");
		paymentDetailDto.setPaymentDetailNo(sequence);
		sqlSession.insert("paymentDetail.insert", paymentDetailDto);
		return sequence;
	}
	
	@Override
	public List<PaymentDto> list() {
		return sqlSession.selectList("payment.list");
	}
	
	@Override
	public PaymentDto find(int paymentNo) {
		return sqlSession.selectOne("payment.one", paymentNo);
	}
	
	@Override
	public List<PaymentDetailDto> listDetail(int paymentNo) {
		return sqlSession.selectList("paymentDetail.list", paymentNo);
	}

	@Override
	@Transactional
	public boolean cancelDetail(PaymentDetailDto paymentDetailDto) {
		int count = sqlSession.update("paymentDetail.cancel", paymentDetailDto.getPaymentDetailNo());
		if(count > 0) {
			sqlSession.update("payment.refresh", paymentDetailDto.getPaymentNo());
		}
		return count > 0;
	}
	
	@Override
	public PaymentDetailDto findDetail(int paymentDetailNo) {
		return sqlSession.selectOne("paymentDetail.one", paymentDetailNo);
	}
	
	@Override
	public int calculateCancelAmountByJava(int paymentNo) {
		int total = 0;
		
		List<PaymentDetailDto> list = sqlSession.selectList("paymentDetail.list", paymentNo);
		for(PaymentDetailDto paymentDetailDto : list) {
			if(paymentDetailDto.getPaymentDetailStatus().equals("승인")) {
				total += paymentDetailDto.getPaymentTotal();//수량 * 가격
			}
		}
		
		return total;
	}
	
	@Override
	public int calculateCancelAmountByOracle(int paymentNo) {
		return sqlSession.selectOne("paymentDetail.calculateCancelAmount", paymentNo);
	}
	
	@Override
	@Transactional
	public void cancelAll(int paymentNo) {
		sqlSession.update("payment.cancelAll", paymentNo);
		sqlSession.update("paymentDetail.cancelAll", paymentNo);
	}

	@Override
	public List<PaymentListVO> treeList() {
		return sqlSession.selectList("payment.treeSearch");
	}


}
