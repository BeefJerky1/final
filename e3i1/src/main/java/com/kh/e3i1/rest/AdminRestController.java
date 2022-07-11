package com.kh.e3i1.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.e3i1.entity.ClubBoardReplyDto;
import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.MbtiSurveyDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.repository.AdminDao;

@CrossOrigin(
		origins = {"http://127.0.0.1:5500"}
	)
@RestController
@RequestMapping("/rest/admin")
public class AdminRestController {
	@Autowired
	private AdminDao adminDao;
	//멤버 리스트
	@GetMapping("/member/{orderType}")
	public List<MemberDto> memberList(@PathVariable(required=false) String orderType){
		return adminDao.memberList(orderType);
	}
	//멤버 삭제
	@DeleteMapping("/member/{memberNo}")
	public int deleteMember(@PathVariable int memberNo){
		return adminDao.deleteMember(memberNo);
	}
	//멤버 상세조회
	@GetMapping("/memberdetail/{memberNo}")
	public MemberDto oneMember(@PathVariable int memberNo){
		return adminDao.oneMember(memberNo);
	}
	//소모임 리스트
	@GetMapping("/club/{orderType}")
	public List<ClubDto> clubList(@PathVariable String orderType){
			return adminDao.clubList(orderType);
	}
	//소모임 삭제
	@DeleteMapping("/club/{clubNo}")
	public int deleteClub(@PathVariable int clubNo){
		return adminDao.deleteClub(clubNo);
	}
	//mbti 설문 목록
	@GetMapping("/mbtisurvey/")
	public List<MbtiSurveyDto> mbtiSurveyList(){
		return adminDao.mbtiSurveyList();
	}
	//mbti 설문 수정
	@PutMapping("/mbtisurvey/")
	public MbtiSurveyDto edit(@RequestBody MbtiSurveyDto mbtiSurveyDto) {
		return adminDao.changeSurveyInformation(mbtiSurveyDto);
	}
	//mbti 설문 추가
	@PostMapping("/mbtisurvey/")
	public MbtiSurveyDto insert(@RequestBody MbtiSurveyDto mbtiSurveyDto) {
		return adminDao.insert(mbtiSurveyDto);
	}
	//mbti 설문 삭제
	@DeleteMapping("/mbtisurvey/{surveyNo}")
	public int deleteSurvey(@PathVariable int surveyNo){
		return adminDao.deleteSurvey(surveyNo);
	}
}
