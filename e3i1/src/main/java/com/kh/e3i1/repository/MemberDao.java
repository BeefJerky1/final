package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.BlockedDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.vo.BlockedVO;
import com.kh.e3i1.vo.MemberComplexSearchVO;
import com.kh.e3i1.vo.MemberDetailVO;

public interface MemberDao {
	
	// 회원가입
	int join(MemberDto memberDto);
	
	// 로그인
	MemberDto login(String memberEmail, String memberPw);
	
	// 이메일 찾기
	String findEmail(MemberDto memberDto);
	
	// 비밀번호 찾기
	MemberDto find(MemberDto memberDto);
	
	// 회원 검색
	List<MemberDto> complexSearch(MemberComplexSearchVO vo);
	
	//비밀번호 변경
	boolean changePassword(String memberEmail, String currentPw, String changePw);
	boolean changePassword(MemberDto memberDto);
	
	// 마이페이지
	MemberDto info(int memberNo);
	
	//회원정보수정
	boolean changeInformation(MemberDto memberDto);
	
	// 회원 탈퇴
	boolean exit(String memberEmail, String memberPw);
	
	// 회원 조회용 list 구문 추가
	List<MemberDto> list();

	MemberDetailVO mypageMember(int memberNo);
	
	//회원 차단
	int blockTarget(BlockedDto blockedDto);
	//회원 차단 목록
	List<BlockedVO> blockList(int memberNo);
	//차단 회원 해제
	int DeleteBlockTarget(int blockedNo);
	//차단 회원 상세정보
	BlockedVO blockedTargetInfo(int blockedNo);
	
}
