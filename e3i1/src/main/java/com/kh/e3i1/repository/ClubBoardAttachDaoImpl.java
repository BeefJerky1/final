package com.kh.e3i1.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ClubBoardAttachDaoImpl implements ClubBoardAttachDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(int attachNo, int clubBoardNo, int clubNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("clubBoardNo", clubBoardNo);
		param.put("clubNo", clubNo);
		param.put("attachNo", attachNo);
		sqlSession.insert("clubboardattach.insert",param);
	}

	@Override
	public int info(int clubBoardNo) {
		Integer attachNo = sqlSession.selectOne("clubboardattach.one", clubBoardNo);
		if(attachNo == null) {
			return 0;
		}
		else {
			return attachNo;
		}
	}
}
