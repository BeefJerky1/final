package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.MbtiBoardDto;
import com.kh.e3i1.entity.MbtiSurveyDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.vo.AdminSearchVO;

public interface AdminDao {
	//멤버 목록
	List<MemberDto> memberList(String column, String order);
	//멤버 검색
	List<MemberDto> memberSearch(AdminSearchVO searchVO); 
	//멤버 총 숫자
	int memberCount();
	//멤버 삭제
	int deleteMember(int memberNo);
	//멤버 상세
	MemberDto oneMember(int memberNo);
	//멤버 수정
	boolean changeMember(MemberDto memberDto);
	//멤버 검색
	List<MemberDto> findMember(AdminSearchVO searchVO);
	//소모임 숫자
	int clubCount();
	//소모임 삭제
	int deleteClub(int clubNo);
	//소모임 상세
	ClubDto oneClub(int clubNo);
	//소모임 목록
	List<ClubDto> clubList(String column, String order);
	//소모임 검색
	List<ClubDto> clubSearch(AdminSearchVO searchVO);
	//소모임 수정
	boolean changeClub(ClubDto clubDto);
	//mbti 설문 목록
	List<MbtiSurveyDto> mbtiSurveyList();
	//mbti설문 수정
	MbtiSurveyDto changeSurveyInformation(MbtiSurveyDto mbtiSurveyDto);
	//mbti설문 추가
	MbtiSurveyDto insert(MbtiSurveyDto mbtiSurveyDto);
	//mbti 설문 삭제
	int deleteSurvey(int surveyNo);
	//mbti 게시판 목록
	List<MbtiBoardDto> mbtiBoardList();



}
