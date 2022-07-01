package com.kh.e3i1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.MbtiBoardReplyDto;
import com.kh.e3i1.vo.MbtiReplyVO;

@Repository
public class MbtiBoardReplyDaoImpl implements  MbtiBoardReplyDao {

	@Autowired SqlSession sqlSession;
	
	@Override
	public MbtiBoardReplyDto insert(MbtiBoardReplyDto mbtiBoardReplyDto) {
		int replyNo = sqlSession.selectOne("mbtiBoardReply.sequence");
		mbtiBoardReplyDto.setReplyNo(replyNo);
		
		sqlSession.insert("mbtiBoardReply.insert", mbtiBoardReplyDto);
		this.calculateReplyCount(mbtiBoardReplyDto.getMbtiBoardNo());
		return sqlSession.selectOne("mbtiBoardReply.one", replyNo);
	}

	@Override
	public List<MbtiReplyVO> list(int mbtiBoardNo) {
	
		return sqlSession.selectList("mbtiBoardReply.list", mbtiBoardNo);
	}

	@Override
	public void delete(int replyNo) {
		MbtiBoardReplyDto mbtiBoardReplyDto = sqlSession.selectOne("mbtiBoardReply.one", replyNo);
		int count = sqlSession.delete("mbtiBoardReply.delete", replyNo);
		// if(count == 0) throw new CannotFindException();
		this.calculateReplyCount(mbtiBoardReplyDto.getMbtiBoardNo());
	}

	@Override
	public MbtiBoardReplyDto edit(MbtiBoardReplyDto mbtiBoardReplyDto) {
		int count = sqlSession.update("mbtiBoardReply.edit", mbtiBoardReplyDto);
		// if(count == 0) throw new CannotFindException();
		return sqlSession.selectOne("mbtiBoardReply.one", mbtiBoardReplyDto.getReplyNo());
	}
	
	
	// 댓글 수 갱신
	@Override
	public void calculateReplyCount(int mbtiBoardNo) {
		sqlSession.update("mbtiBoardReply.calculateReplyCount", mbtiBoardNo);
		
	}

}
