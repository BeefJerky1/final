package com.kh.e3i1.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubPlusDto;

@Repository
public class ClubPlusDaoImpl implements ClubPlusDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ClubPlusDto find(int no) {
		return sqlSession.selectOne("clubPlus.one", no);
	}
	

}
