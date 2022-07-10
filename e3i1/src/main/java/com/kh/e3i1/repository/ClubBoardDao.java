package com.kh.e3i1.repository;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.web.bind.annotation.PathVariable;

import com.kh.e3i1.entity.ClubBoardDto;
import com.kh.e3i1.entity.ClubBoardLikeDto;
import com.kh.e3i1.vo.ClubBoardListItemVO;
import com.kh.e3i1.vo.ClubMemberProfileVO;

public interface ClubBoardDao {

	List<ClubBoardDto> list(int clubNo,String orderType);

	ClubBoardDto insert(ClubBoardDto clubBoardDto);

	boolean delete(int clubBoardNo);

	ClubBoardListItemVO detail(int clubBoardNo, int memberNo);
	
	ClubBoardListItemVO detail(int clubBoardNo);

	ClubBoardDto edit(ClubBoardDto clubBoardDto);

	List<ClubBoardListItemVO> clubBoardListItem(int clubNo);

	List<ClubBoardListItemVO> listAll(int clubNo, int likeMemberNo);

	ClubBoardDto readcount(int clubBoardNo);

	ClubMemberProfileVO memberProfile(int memberNo);

	void calculateReportCount(int clubNo);
	
	void calculateReplyCount(int clubNo);

	void calculateLikeCount(int clubNo);



}
