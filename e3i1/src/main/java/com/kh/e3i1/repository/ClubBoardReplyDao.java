package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.ClubBoardReplyDto;
import com.kh.e3i1.vo.ClubBoardReplyListVO;

public interface ClubBoardReplyDao {

	ClubBoardReplyDto insert(ClubBoardReplyDto clubBoardReplyDto);

	List<ClubBoardReplyDto> list(int clubBoardNo);

	void delete(int replyNo);

	ClubBoardReplyDto edit(ClubBoardReplyDto clubBoardReplyDto);

	void calculateReplyCount(int clubBoardNo);

	List<ClubBoardReplyListVO> listAll(int clubBoardNo, int likeMemberNo);

}
