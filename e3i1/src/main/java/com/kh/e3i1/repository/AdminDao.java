package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.MbtiSurveyDto;
import com.kh.e3i1.entity.MemberDto;

public interface AdminDao {
	//멤버 목록
	List<MemberDto> memberList(String orderType); 
	//멤버 삭제
	int deleteMember(int memberNo);
	//멤버 상세
	MemberDto oneMember(int memberNo);
	//멤버 수정
	boolean changeMember(MemberDto memberDto);
	//소모임 삭제
	int deleteClub(int clubNo);
	//소모임 상세
	ClubDto oneClub(int clubNo);
	//소모임 목록
	List<ClubDto> clubList(String orderType);
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

}
