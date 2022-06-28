package com.kh.e3i1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubDto;

@Repository
public class ClubDaoImpl implements ClubDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ClubDto> list() {
		return sqlSession.selectList("club.list");
	}

}
