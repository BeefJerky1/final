package com.kh.e3i1.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClubProfileDaoImpl implements ClubProfileDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insert(int clubNo, int attachNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("clubNo", clubNo);
		param.put("attachNo", attachNo);
		return sqlSession.insert("clubProfile.insert",param);
	}

	@Override
	public int info(int clubNo) {
		Integer attachNo = sqlSession.selectOne("clubProfile.one", clubNo);
		if(attachNo == null) {
			return 0;
		}
		else {
			return attachNo;
		}
	}
}
