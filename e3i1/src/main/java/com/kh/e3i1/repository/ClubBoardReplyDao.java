package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.ClubBoardReplyDto;

public interface ClubBoardReplyDao {

	ClubBoardReplyDto insert(ClubBoardReplyDto clubBoardReplyDto);

	List<ClubBoardReplyDto> list(int clubBoardNo);

	void delete(int replyNo);

	ClubBoardReplyDto edit(ClubBoardReplyDto clubBoardReplyDto);

	void calculateReplyCount(int clubBoardNo);

}
