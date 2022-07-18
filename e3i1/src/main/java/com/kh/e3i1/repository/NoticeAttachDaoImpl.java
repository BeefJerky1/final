package com.kh.e3i1.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeAttachDaoImpl implements NoticeAttachDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(int noticeNo, int attachNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("noticeNo", noticeNo);
		param.put("attachNo", attachNo);
		sqlSession.insert("noticeAttach.insert", param);
	}
	
}
