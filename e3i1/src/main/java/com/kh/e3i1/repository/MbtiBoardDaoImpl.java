package com.kh.e3i1.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.MbtiBoardDto;
import com.kh.e3i1.vo.MbtiMemberListVO;

@Repository
public class MbtiBoardDaoImpl implements MbtiBoardDao{
	
	@Autowired
	private SqlSession sqlSession;

	
	// 목록
	@Override
	public List<MbtiMemberListVO> list(String type, String keyword) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		
		return sqlSession.selectList("mbtiBoard.mbtiboardList", param);
	}

	// 게시판 상세 페이지
	@Override
	public MbtiMemberListVO read(int mbtiBoardNo) {
		
		return sqlSession.selectOne("mbtiBoard.one", mbtiBoardNo);
	}

	// 게시판 글 작성하기
	
	@Override
	public int write(MbtiBoardDto mbtiBoardDto) {
		int mbtiBoardNo = sqlSession.selectOne("mbtiBoard.sequence");
		mbtiBoardDto.setMbtiBoardNo(mbtiBoardNo);
		
		sqlSession.insert("mbtiBoard.write", mbtiBoardDto);
		
		return mbtiBoardNo;
	}

	// 게시판 글 삭제하기
	
	@Override
	public boolean delete(int mbtiBoardNo) {
		
		int count = sqlSession.delete("mbtiBoard.delete", mbtiBoardNo);
		return count > 0;
		
	}

	// 게시판 글 수정하기
	
	@Override
	public MbtiBoardDto info(int mbtiBoardNo) {
		return sqlSession.selectOne("mbtiBoard.info", mbtiBoardNo);
		
	}
	

	@Override
	public boolean edit(MbtiBoardDto mbtiBoardDto) {
		int count = sqlSession.update("mbtiBoard.update", mbtiBoardDto);
		return count > 0;
	}

}
