package com.kh.e3i1.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubBoardDto;
import com.kh.e3i1.vo.ClubBoardListItemVO;

@Repository
public class ClubBoardDaoImpl implements ClubBoardDao{

	@Autowired
	private SqlSession sqlSession;
	
	
//	@Override
//	public List<ClubBoardDto> list(int clubNo) {
//		this.calculateReplyCount(clubNo);
//		return sqlSession.selectList("clubboard.list", clubNo);
//	}
	
	@Override
	public List<ClubBoardDto> list(int clubNo) {
		this.calculateReplyCount(clubNo);
		this.calculateLikeCount(clubNo);
		return sqlSession.selectList("clubboard.list", clubNo);
	}

	//등록
	@Override
	public ClubBoardDto insert(ClubBoardDto clubBoardDto) {
		int clubBoardNo = sqlSession.selectOne("clubboard.sequence");
		clubBoardDto.setClubBoardNo(clubBoardNo);
		sqlSession.insert("clubboard.insert", clubBoardDto);
		
		return sqlSession.selectOne("clubboard.info", clubBoardNo);
	}

	//삭제
	@Override
	public boolean delete(int clubBoardNo) {
		int count = sqlSession.delete("clubboard.delete", clubBoardNo);
		return count>0;
	}

	//상세조회
	@Override
	public ClubBoardListItemVO selectOne(int clubBoardNo) {
		this.calculateReplyCount(clubBoardNo);
		this.calculateLikeCount(clubBoardNo);
		return sqlSession.selectOne("clubboard.one", clubBoardNo);
	}


	@Override
	public ClubBoardDto edit(ClubBoardDto clubBoardDto) {
		int count = sqlSession.update("clubboard.edit", clubBoardDto);
		if(count==0) {
			return sqlSession.selectOne("clubboard.info", clubBoardDto.getClubBoardNo());
		}
		return sqlSession.selectOne("clubboard.info", clubBoardDto.getClubBoardNo());
	}
	//댓글 수 조회
	@Override
	public void calculateReplyCount(int clubNo) {
		sqlSession.update("clubboard.calculateReplyCount",clubNo);	
	}
	//좋아요 수 조회
	@Override
	public void calculateLikeCount(int clubNo) {
		sqlSession.update("clubboard.calculateLikeCount",clubNo);	
	}
	//리스트 조회
	@Override
	public List<ClubBoardListItemVO> listAll(int clubNo){
//			this.calculateReplyCount(clubNo);
			return sqlSession.selectList("clubboard.clubBoardTotalList", clubNo);
	}
	@Override
	public List<ClubBoardListItemVO> clubBoardListItem(int clubNo) {
		return sqlSession.selectList("clubboard.subListQuery",clubNo);
	}

	

	

}
