package com.kh.e3i1.repository;

import com.kh.e3i1.entity.ClubBoardLikeDto;

public interface ClubBoardLikeDao {
	int selectList(int clubBoardNo, int clubBoardWriter);

	ClubBoardLikeDto insert(ClubBoardLikeDto clubBoardLikeDto);

	void delete(ClubBoardLikeDto clubBoardLikeDto);

	void calculateLikeCount(int clubBoardNo);
}
