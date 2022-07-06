package com.kh.e3i1.repository;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;

import com.kh.e3i1.entity.ClubBoardDto;
import com.kh.e3i1.vo.ClubBoardListItemVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
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
	public List<ClubBoardDto> list(int clubNo , String orderType) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("clubNo",clubNo);
		param.put("orderType", orderType);
		log.debug("orderType = {}", orderType);
		return sqlSession.selectList("clubboard.board-side", param);
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
	public ClubBoardListItemVO detail(int clubBoardNo) {
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
	public void calculateReplyCount(int clubBoardNo) {
		sqlSession.update("clubboard.calculateReplyCount",clubBoardNo);	
	}
	//좋아요 수 조회
	@Override
	public void calculateLikeCount(int clubBoardNo) {
		sqlSession.update("clubboard.calculateLikeCount",clubBoardNo);	
	}
	//리스트 조회
	@Override
	public List<ClubBoardListItemVO> listAll(int clubNo, int likeMemberNo){
			this.calculateReplyCount(clubNo);
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("clubNo", clubNo);
			param.put("likeMemberNo", likeMemberNo);
			List<ClubBoardListItemVO> list1=  sqlSession.selectList("clubboard.clubBoardTotalList", param);
			return list1;		
	}
	@Override
	public List<ClubBoardListItemVO> clubBoardListItem(int clubNo) {
		return sqlSession.selectList("clubboard.subListQuery",clubNo);
	}

	@Override
	public ClubBoardDto readcount(int clubBoardNo) {
		sqlSession.update("clubboard.readcount", clubBoardNo);
		return sqlSession.selectOne("clubboard.info", clubBoardNo);
	}

	

	

}
