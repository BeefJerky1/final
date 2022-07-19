package com.kh.e3i1.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberProfileDaoImpl implements MemberProfileDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insert(int memberNo, int attachNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("memberNo", memberNo);
		param.put("attachNo", attachNo);
		return sqlSession.insert("memberProfile.insert", param);
	}
	
	@Override
	public int update(int memberNo, int attachNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("memberNo", memberNo);
		param.put("attachNo", attachNo);
		return sqlSession.insert("memberProfile.update", param);
	}

}
