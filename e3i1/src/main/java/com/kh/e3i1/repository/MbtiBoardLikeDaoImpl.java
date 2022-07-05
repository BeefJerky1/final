package com.kh.e3i1.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.MbtiBoardLikeDto;

@Repository
public class MbtiBoardLikeDaoImpl implements MbtiBoardLikeDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int likeCount(MbtiBoardLikeDto mbtiBoardLikeDto) {
			return sqlSession.selectOne("mbtiBoardLike.likeCount", mbtiBoardLikeDto);
		}
	
	public int ItLikeInfo(MbtiBoardLikeDto mbtiBoardLikeDto) {
		return sqlSession.selectOne("mbtiBoardLike.ItLikeInfo", mbtiBoardLikeDto);
	}
	
	public void likeInsert(MbtiBoardLikeDto mbtiBoardLikeDto) {
	
		sqlSession.insert("mbtiBoardLike.likeInsert", mbtiBoardLikeDto);
	}
	
	public MbtiBoardLikeDto likeUpdate(MbtiBoardLikeDto mbtiBoardLikeDto) {
		sqlSession.update("mbtiBoardLike.likeUpdate", mbtiBoardLikeDto);
		return mbtiBoardLikeDto;
	}
	


}

