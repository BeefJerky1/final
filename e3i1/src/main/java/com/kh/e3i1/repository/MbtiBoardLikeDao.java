package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.MbtiBoardLikeDto;

public interface MbtiBoardLikeDao {
	
	int likeCount(MbtiBoardLikeDto mbtiBoardLikeDto);
	
	int ItLikeInfo(MbtiBoardLikeDto mbtiBoardLikeDto);
	
	void likeInsert(MbtiBoardLikeDto mbtiBoardLikeDto);
	MbtiBoardLikeDto likeUpdate(MbtiBoardLikeDto mbtiBoardLikeDto);

	List<MbtiBoardLikeDto> list(int mbtiBoardNo);
}


