package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.MbtiBoardLikeDto;

public interface MbtiBoardLikeDao {
	
	int likeCount(int mbtiBoardNo);
	
	Integer ItLikeInfo(MbtiBoardLikeDto mbtiBoardLikeDto);
	
	void likeInsert(MbtiBoardLikeDto mbtiBoardLikeDto);

	List<MbtiBoardLikeDto> list(int mbtiBoardNo);

	void likeUpdate(MbtiBoardLikeDto mbtiBoardLikeDto);
	void likeDelete(MbtiBoardLikeDto mbtiBoardLikeDto);
}


