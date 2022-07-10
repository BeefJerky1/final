package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.ClubMemberDto;
import com.kh.e3i1.vo.ClubMemberListVO;

public interface ClubMemberDao {
	void insertClubLeader(int clubNo, int memberNo);
	int insert(ClubMemberDto clubMemberDto);
	ClubMemberDto one(int clubNo, int memberNo);
	List<ClubMemberListVO> select(int clubNo);
	public int approveClub(int clubMemberNo);
	int refuseClub(ClubMemberDto clubMemberDto);
}
