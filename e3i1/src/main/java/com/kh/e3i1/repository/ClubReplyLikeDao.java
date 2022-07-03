package com.kh.e3i1.repository;

import com.kh.e3i1.entity.ClubReplyLikeDto;

public interface ClubReplyLikeDao {

	ClubReplyLikeDto insert(ClubReplyLikeDto clubReplyLikeDto);

	int selectList(int replyNo, int memberNo);

	void calculateLikeCount(int clubBoardNo);

	void delete(ClubReplyLikeDto clubReplyLikeDto);

}
