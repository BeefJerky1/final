package com.kh.e3i1.repository;

import com.kh.e3i1.entity.ClubMemberDto;

public interface ClubMemberDao {
	void insertClubLeader(int clubNo, int memberNo);
	int insert(ClubMemberDto clubMemberDto);
}
