package com.kh.e3i1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubBoardDto;

@Repository
public class ClubBoardDaoImpl implements ClubBoardDao{

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<ClubBoardDto> list(int clubNo) {
		return sqlSession.selectList("clubboard.list", clubNo);
	}

}
