package com.kh.e3i1.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubBoardDto;
import com.kh.e3i1.entity.ClubBoardLikeDto;
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
		return sqlSession.selectList("clubboard.list", clubNo);
	}


	@Override
	public ClubBoardDto insert(ClubBoardDto clubBoardDto) {
		int clubBoardNo = sqlSession.selectOne("clubboard.sequence");
		clubBoardDto.setClubBoardNo(clubBoardNo);
		sqlSession.insert("clubboard.insert", clubBoardDto);
		return sqlSession.selectOne("clubboard.one", clubBoardNo);
	}


	@Override
	public boolean delete(int clubBoardNo) {
		int count = sqlSession.delete("clubboard.delete", clubBoardNo);
		return count>0;
	}


	@Override
	public ClubBoardDto selectOne(int clubBoardNo) {
		return sqlSession.selectOne("clubboard.one", clubBoardNo);
	}


	@Override
	public ClubBoardDto edit(ClubBoardDto clubBoardDto) {
		int count = sqlSession.update("clubboard.edit", clubBoardDto);
		if(count==0) {
			return sqlSession.selectOne("clubboard.one", clubBoardDto.getClubBoardNo());
		}
		return sqlSession.selectOne("clubboard.one", clubBoardDto.getClubBoardNo());
	}
	@Override
	public void calculateReplyCount(int clubNo) {
		sqlSession.update("clubboard.calculateReplyCount",clubNo);	
	}
	@Override
	public List<ClubBoardListItemVO> listAll(int clubNo) {
//		this.calculateReplyCount(clubNo);
		return sqlSession.selectList("clubboard.clubBoardTotalList", clubNo);
	}
	@Override
	public List<ClubBoardListItemVO> clubBoardListItem(int clubNo) {
		return sqlSession.selectList("clubboard.subListQuery",clubNo);
	}

	

}
