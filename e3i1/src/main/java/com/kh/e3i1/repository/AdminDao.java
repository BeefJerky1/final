package com.kh.e3i1.repository;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.AnimalPhotoDto;
import com.kh.e3i1.entity.ClubBoardDto;
import com.kh.e3i1.entity.ClubBoardReplyDto;
import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.MbtiAnimalDto;
import com.kh.e3i1.entity.MbtiBoardDto;
import com.kh.e3i1.entity.MbtiSurveyDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.entity.NoticeDto;
import com.kh.e3i1.entity.PaymentDetailDto;
import com.kh.e3i1.entity.PaymentDto;
import com.kh.e3i1.vo.AdminClubSearchVO;
import com.kh.e3i1.vo.AdminMbtiAnimalListVO;
import com.kh.e3i1.vo.AdminSearchVO;
import com.kh.e3i1.vo.ClubMemberListVO;
import com.kh.e3i1.vo.ClubStatisticVO;
import com.kh.e3i1.vo.PaymentDetailVO;

public interface AdminDao {
	//멤버 목록
	List<MemberDto> memberList(String column, String order);
	//멤버 검색
	List<MemberDto> memberSearch(AdminSearchVO searchVO); 
	//멤버 총 숫자
	int memberCount();
	//멤버 삭제
	List<Integer> deleteMember(List<Integer> memberNo);
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
	//소모임 멤버 목록
	List<ClubMemberListVO> clubMemberList(int clubNo);
	//소모임 게시글 목록
	List<ClubBoardDto> clubBoardList(String column, String order, int clubNo);
	//소모임 게시글 검색
	List<ClubBoardDto> clubBoardSearch(AdminClubSearchVO searchVO);
	//소모임 게시판 통계
	List<ClubStatisticVO> clubBoardStat(int clubNo);
	//소모임 댓글 목록
	List<ClubBoardReplyDto> clubReplyList(int clubNo);
	//mbti 설문 목록
	List<MbtiSurveyDto> mbtiSurveyList();
	//mbti설문 수정
	MbtiSurveyDto changeSurveyInformation(MbtiSurveyDto mbtiSurveyDto);
	//mbti설문 추가
	MbtiSurveyDto insert(MbtiSurveyDto mbtiSurveyDto);
	//mbti 설문 삭제
	int deleteSurvey(int surveyNo);
	//mbti 게시판 목록
	List<MbtiBoardDto> mbtiBoardList(String column, String order);
	//mbti 게시판 검색
	List<MbtiBoardDto> findBoard(AdminSearchVO searchVO);
	//mbti 게시판 게시글 수
	int mbtiBoardCount();
	//mbti 동물리스트
	List<AdminMbtiAnimalListVO> mbtiAnimalList();
	//동물 사진 등록
	int insertPhoto(int attachNo, int animalNo);
	//mbti 동물 등록
	int insertMbtiAnimal(MbtiAnimalDto mbtiAnimalDto);
	//동물 삭제
	int mbtianimalDelete(int animalNo);
	//결제 목록
	List<PaymentDto> paymentList(String column, String order);
	//결제 상세
	PaymentDetailVO paymentDetail(int paymentNo);
	//결제 검색
	List<PaymentDto> paymentSearch(AdminSearchVO searchVO);
	//공지 리스트
	List<NoticeDto> noticeList(String column, String order);
	//공지 삭제
	List<Integer> deleteNotice(List<Integer> noticeNo);
	



}
