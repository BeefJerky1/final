package com.kh.e3i1.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubBoardLikeDto;

@Repository
public class ClubBoardLikeDaoImpl implements ClubBoardLikeDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int findLike(int clubBoardNo, int likeMemberNo) {
		ClubBoardLikeDto clubBoardLikeDto = new ClubBoardLikeDto();
		clubBoardLikeDto.setLikeMemberNo(likeMemberNo);
		clubBoardLikeDto.setClubBoardNo(clubBoardNo);
		this.calculateLikeCount(clubBoardNo);
		Integer checkLike = sqlSession.selectOne("clubboardlike.checkLike", clubBoardLikeDto);
		if(checkLike==null) {
			return 0;
		}else {
			return 1;
		}
	}

	@Override
	public ClubBoardLikeDto insert(ClubBoardLikeDto clubBoardLikeDto) {
		int clubBoardLikeNo = sqlSession.selectOne("clubboardlike.sequence");
		clubBoardLikeDto.setClubBoardLikeNo(clubBoardLikeNo);
		sqlSession.insert("clubboardlike.insert", clubBoardLikeDto);
		this.calculateLikeCount(clubBoardLikeDto.getClubBoardNo());
		return sqlSession.selectOne("clubboardlike.one", clubBoardLikeNo);
	}

	@Override
	public void delete(ClubBoardLikeDto clubBoardLikeDto) {
		int clubBoardLikeNo = sqlSession.selectOne("clubboardlike.pk", clubBoardLikeDto);
		sqlSession.delete("clubboardlike.delete", clubBoardLikeNo);
		this.calculateLikeCount(clubBoardLikeDto.getClubBoardNo());
	}
	@Override
	public void calculateLikeCount(int clubBoardNo) {
		sqlSession.update("clubboardlike.calculateLikeCount",clubBoardNo);	
	}

	@Override
	public int findLikeList(int clubBoardNo, int likeMemberNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("clubBoardNo", clubBoardNo);
		param.put("likeMemberNo", likeMemberNo);
		Integer cluBboardNo = sqlSession.selectOne("clubboardlike.findlikelist", param);
		if(cluBboardNo==1) {
			return 1;
		}else {
			return 0;
	}
	}
}
