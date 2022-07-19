package com.kh.e3i1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.MbtiBoardLikeDto;

@Repository
public class MbtiBoardLikeDaoImpl implements MbtiBoardLikeDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// count 하는 구문
	public int likeCount(int mbtiBoardNo) {
			return sqlSession.selectOne("mbtiBoardLike.likeCount", mbtiBoardNo);
		}
	
	// 좋아요가 있는 경우 다시 select하는 단일 조회 구문
	public Integer ItLikeInfo(MbtiBoardLikeDto mbtiBoardLikeDto) {
		return sqlSession.selectOne("mbtiBoardLike.ItLikeInfo", mbtiBoardLikeDto);
	}
	
	// 좋아요가 없는 경우 insert 
	public void likeInsert(MbtiBoardLikeDto mbtiBoardLikeDto) {
	
		sqlSession.insert("mbtiBoardLike.likeInsert", mbtiBoardLikeDto);
	}
	// 좋아요 업데이트
	public void likeUpdate(MbtiBoardLikeDto mbtiBoardLikeDto) {
		sqlSession.update("mbtiBoardLike.likeUpdate", mbtiBoardLikeDto);
	}
	// 좋아요 업데이트
	@Override
	public void likeDelete(MbtiBoardLikeDto mbtiBoardLikeDto) {
		sqlSession.update("mbtiBoardLike.likeDelete", mbtiBoardLikeDto);
		
	}
	@Override
	public List<MbtiBoardLikeDto> list(int mbtiBoardNo) {
		return sqlSession.selectList("mbtiBoardLike.list", mbtiBoardNo);
	}

	


}

