package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.vo.MemberComplexSearchVO;

public interface MemberDao {
	
	void join(MemberDto memberDto);
	MemberDto login(String memberEmail, String memberPw);
	MemberDto info(String MemberEmail);
	String findEmail(MemberDto memberDto);
	MemberDto findPw(MemberDto memberDto);
	
	List<MemberDto> complexSearch(MemberComplexSearchVO vo);
	
	boolean changeInformation(MemberDto memberDto);
	boolean changePassword(String memberEmail, String currentPw, String changePw);
	boolean changePassword(MemberDto memberDto);
	boolean exit(String memberEmail, String memberPw);
	
}
