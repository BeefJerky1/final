package com.kh.e3i1.repository;

import com.kh.e3i1.entity.ClubBoardLikeDto;

public interface ClubBoardLikeDao {

	ClubBoardLikeDto insert(ClubBoardLikeDto clubBoardLikeDto);

	void delete(ClubBoardLikeDto clubBoardLikeDto);

	void calculateLikeCount(int clubBoardNo);

	int findLike(int clubBoardNo, int memberNo);
}
