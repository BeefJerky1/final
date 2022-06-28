package com.kh.e3i1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.MbtiSurveyDto;

@Repository
public class MbtiSurveyDaoImpl implements MbtiSurveyDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MbtiSurveyDto> select() {
		return sqlSession.selectList("mbti.list");
	}
}
