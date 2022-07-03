package com.kh.e3i1.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubBoardLikeDto;

@Repository
public class ClubBoardLikeDaoImpl implements ClubBoardLikeDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectList(int clubBoardNo, int clubBoardWriter) {
		ClubBoardLikeDto clubBoardLikeDto = new ClubBoardLikeDto();
		clubBoardLikeDto.setMemberNo(clubBoardWriter);
		clubBoardLikeDto.setClubBoardNo(clubBoardNo);
		ClubBoardLikeDto isExist = sqlSession.selectOne("clubboardlike.checkLike", clubBoardLikeDto);
		if (isExist == null) {
			return 0;
		} else {
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
}
