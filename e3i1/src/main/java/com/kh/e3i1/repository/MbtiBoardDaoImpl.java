package com.kh.e3i1.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.MbtiBoardDto;
import com.kh.e3i1.entity.MbtiBoardVoteDto;
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

	@Override
	public int count(String keyword) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("keyword", keyword);
		
		return sqlSession.selectOne("mbtiBoard.count", param);
	}

	@Override
	public List<MbtiMemberListVO> list(String keyword, int page, int size) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("keyword", keyword);
		
		int end = page * size;
		int begin = end - (size - 1);
		param.put("begin", begin);
		param.put("end", end);
		
		return sqlSession.selectList("mbtiBoard.mbtiboardList2", param);
	}

	// 투표하기
	
	@Override
	public MbtiBoardVoteDto vote(MbtiBoardVoteDto mbtiBoardVoteDto) {
		int voteChoiceNo = sqlSession.selectOne("mbtiBoardVote.sequence");
		mbtiBoardVoteDto.setVoteChoiceNo(voteChoiceNo);
		
		sqlSession.insert("mbtiBoardVote.vote", mbtiBoardVoteDto);
		return mbtiBoardVoteDto;
	}
	
	// 투표 공감 개수 구하기
	@Override
	public int voteCount(int mbtiBoardNo) {
		return sqlSession.selectOne("mbtiBoardVote.voteCount", mbtiBoardNo);
	}
	
	// 전체 투표 개수 구하기

	@Override
	public int voteCountTotal(int mbtiBoardNo) {
		
		return sqlSession.selectOne("mbtiBoardVote.voteCountTotal", mbtiBoardNo);
	}

	// 투표 유무 확인
	@Override
	public Integer itVoteinfo(MbtiBoardVoteDto mbtiBoardVoteDto) {
		return sqlSession.selectOne("mbtiBoardVote.itVoteInfo", mbtiBoardVoteDto);
	}
	// 투표 취소
	@Override
	public void voteDelete(MbtiBoardVoteDto mbtiBoardVoteDto) {
		sqlSession.delete("mbtiBoardVote.voteDelete", mbtiBoardVoteDto);
		
	}



}
