package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.ClubMemberDto;
import com.kh.e3i1.vo.ClubMemberListVO;

public interface ClubMemberDao {
	void insertClubLeader(int clubNo, int memberNo);
	int insert(ClubMemberDto clubMemberDto);
	ClubMemberDto one(int clubNo, int memberNo);
	List<ClubMemberListVO> selectPermission(int clubNo);
	List<ClubMemberListVO> select(int clubNo);
	int approveClub(int clubMemberNo);
	int refuseClub(ClubMemberDto clubMemberDto);
	
	//소모임 멤버확인용
	int check(int clubNo, int memberNo);
}
