package com.kh.e3i1.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubPaymentDto;


@Repository
public class ClubPaymentDaoImpl implements ClubPaymentDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertClubPayment(ClubPaymentDto clubPaymentDto) {
		sqlSession.insert("clubPayment.insert",clubPaymentDto);
	}


}
