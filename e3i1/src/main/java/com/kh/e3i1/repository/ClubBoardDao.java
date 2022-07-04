package com.kh.e3i1.repository;

import java.util.List;
import java.util.Map;

import com.kh.e3i1.entity.ClubBoardDto;
import com.kh.e3i1.entity.ClubBoardLikeDto;
import com.kh.e3i1.vo.ClubBoardListItemVO;

public interface ClubBoardDao {

	List<ClubBoardDto> list(int clubNo,String orderType);

	ClubBoardDto insert(ClubBoardDto clubBoardDto);

	boolean delete(int clubBoardNo);

	ClubBoardListItemVO selectOne(int clubBoardNo);

	ClubBoardDto edit(ClubBoardDto clubBoardDto);

	void calculateReplyCount(int clubNo);

	void calculateLikeCount(int clubNo);

	List<ClubBoardListItemVO> clubBoardListItem(int clubNo);

	List<ClubBoardListItemVO> listAll(int clubNo);

	ClubBoardDto readcount(int clubBoardNo);



}
