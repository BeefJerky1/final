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
		return sqlSession.selectOne("clubboardreply.info", replyNo);
	}

	@Override
	public List<ClubBoardReplyDto> list(int clubBoardNo) {
		return sqlSession.selectList("clubboardreply.list",clubBoardNo);
	}

	@Override
	public int delete(int replyNo) {
		ClubBoardReplyDto clubBoardReplyDto = sqlSession.selectOne("clubboardreply.info",replyNo);
		sqlSession.delete("clubboardreply.delete", replyNo);
		this.calculateReplyCount(clubBoardReplyDto.getClubBoardNo());
		ClubBoardReplyDto resultDto = sqlSession.selectOne("clubboardreply.info",replyNo);
		if(resultDto!=null) {
			return 0;
		}else {
			return 1;
		}
		
	}

	@Override
	public ClubBoardReplyDto edit(ClubBoardReplyDto clubBoardReplyDto) {
		int count = sqlSession.update("clubboardreply.edit", clubBoardReplyDto);
		if(count==0) {
//			throw new CannotFindException();
		}
		return sqlSession.selectOne("clubboardreply.info", clubBoardReplyDto.getReplyNo());
	}
	@Override
	public void calculateReplyCount(int clubBoardNo) {
		sqlSession.update("clubboardreply.calculateReplyCount",clubBoardNo);	
	}
	@Override
	public void calculateReportCount(int clubBoardNo) {
		sqlSession.update("clubboardreply.calculateReportCount",clubBoardNo);	
	}
	@Override
	public List<ClubBoardReplyListVO> listAll(int clubBoardNo, int likeMemberNo) {
		List<ClubBoardReplyDto> list= sqlSession.selectList("clubboardreply.boardlist", clubBoardNo);
		for(ClubBoardReplyDto dto : list) {
			this.calculateReportCount(dto.getReplyNo());			
		}
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("clubBoardNo", clubBoardNo);
		param.put("likeMemberNo", likeMemberNo);
		return sqlSession.selectList("clubboardreply.clubReplyTotalList", param);
	}

	@Override
	public ClubBoardReplyListVO reportInfo(int replyNo) {
		return sqlSession.selectOne("clubboardreply.one", replyNo);
	}
}
