package com.kh.e3i1.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubBoardReplyDto;
import com.kh.e3i1.vo.ClubBoardListItemVO;
import com.kh.e3i1.vo.ClubBoardReplyListVO;
@Repository
public class ClubBoardReplyDaoImpl implements ClubBoardReplyDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ClubBoardReplyDto insert(ClubBoardReplyDto clubBoardReplyDto) {
		int replyNo = sqlSession.selectOne("clubboardreply.sequence");
		clubBoardReplyDto.setReplyNo(replyNo);
		sqlSession.insert("clubboardreply.insert", clubBoardReplyDto);
		this.calculateReplyCount(clubBoardReplyDto.getClubBoardNo());
		return sqlSession.selectOne("clubboardreply.one", replyNo);
	}

	@Override
	public List<ClubBoardReplyDto> list(int clubBoardNo) {
		return sqlSession.selectList("clubboardreply.list",clubBoardNo);
	}

	@Override
	public void delete(int replyNo) {
		ClubBoardReplyDto clubBoardReplyDto = sqlSession.selectOne("clubboardreply.one",replyNo);
		int count = sqlSession.delete("clubboardreply.delete", replyNo);
//		if(count==0)throw new CannotFindException();
		this.calculateReplyCount(clubBoardReplyDto.getClubBoardNo());
		
	}

	@Override
	public ClubBoardReplyDto edit(ClubBoardReplyDto clubBoardReplyDto) {
		int count = sqlSession.update("clubboardreply.edit", clubBoardReplyDto);
		if(count==0) {
//			throw new CannotFindException();
		}
		return sqlSession.selectOne("clubboardreply.one", clubBoardReplyDto.getReplyNo());
	}
	@Override
	public void calculateReplyCount(int clubBoardNo) {
		sqlSession.update("clubboardreply.calculateReplyCount",clubBoardNo);	
	}
	@Override
	public List<ClubBoardReplyListVO> listAll(int clubBoardNo, int likeMemberNo) {
//		this.calculateReplyCount(clubNo);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("clubBoardNo", clubBoardNo);
		param.put("likeMemberNo", likeMemberNo);
		return sqlSession.selectList("clubboardreply.clubReplyTotalList", param);
	}
}
