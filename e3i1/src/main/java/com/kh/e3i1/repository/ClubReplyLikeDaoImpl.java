package com.kh.e3i1.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubBoardReplyDto;
import com.kh.e3i1.entity.ClubReplyLikeDto;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Repository
public class ClubReplyLikeDaoImpl implements ClubReplyLikeDao{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectList(int replyNo, int memberNo) {
		ClubReplyLikeDto clubReplyLikeDto = new ClubReplyLikeDto();
		clubReplyLikeDto.setLikeMemberNo(memberNo);
		clubReplyLikeDto.setReplyNo(replyNo);
		ClubReplyLikeDto isExist = sqlSession.selectOne("clubreplylike.checkLike", clubReplyLikeDto);
		if (isExist == null) {
			return 0;
		} else {
			return 2;
		}
	}

	@Override
	public ClubReplyLikeDto insert(ClubReplyLikeDto clubReplyLikeDto) {
		int clubReplyLikeNo = sqlSession.selectOne("clubreplylike.sequence");
		clubReplyLikeDto.setClubReplyLikeNo(clubReplyLikeNo);
		sqlSession.insert("clubreplylike.insert", clubReplyLikeDto);
		this.calculateLikeCount(clubReplyLikeDto.getReplyNo());
		return sqlSession.selectOne("clubreplylike.one", clubReplyLikeNo);
	}
	@Override
	public void delete(ClubReplyLikeDto clubReplyLikeDto) {
		int clubReplyLikeNo = sqlSession.selectOne("clubreplylike.pk", clubReplyLikeDto);
		sqlSession.delete("clubreplylike.delete", clubReplyLikeNo);
		this.calculateLikeCount(clubReplyLikeDto.getReplyNo());
	}
	@Override
	public void calculateLikeCount(int replyNo) {
		sqlSession.update("clubreplylike.calculateLikeCount",replyNo);	
	}
}


