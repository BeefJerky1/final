package com.kh.e3i1.rest;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.ClubBoardDto;
import com.kh.e3i1.entity.ClubBoardReplyDto;
import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.MbtiAnimalDto;
import com.kh.e3i1.entity.MbtiBoardDto;
import com.kh.e3i1.entity.MbtiSurveyDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.repository.AdminDao;
import com.kh.e3i1.repository.ClubMemberDao;
import com.kh.e3i1.service.AdminService;
import com.kh.e3i1.vo.AdminClubSearchVO;
import com.kh.e3i1.vo.AdminMbtiAnimalListVO;
import com.kh.e3i1.vo.AdminSearchVO;
import com.kh.e3i1.vo.ClubMemberListVO;
import com.kh.e3i1.vo.ClubStatisticVO;

@CrossOrigin(
		origins = {"http://127.0.0.1:5500"}
	)
@RestController
@RequestMapping("/rest/admin")
public class AdminRestController {
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private ClubMemberDao clubMemberDao;
	@Autowired
	private AdminService adminService;
	//멤버 리스트
	@GetMapping("/member/{column}/{order}")
	public List<MemberDto> memberList(@PathVariable String column, @PathVariable String order){
		return adminDao.memberList(column, order);
	}
	//검색
	@PostMapping("/member")
	public List<MemberDto> memberSearch(@RequestBody AdminSearchVO searchVO){
		return adminDao.memberSearch(searchVO);
	}
	//총 회원수
	@GetMapping("/membercount")
	public int memberCount(){
		return adminDao.memberCount();
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
//	//멤버 검색
//	@PostMapping("/membersearch")
//	public List<MemberDto> findMember(@RequestBody AdminSearchVO searchVO) {
//		return adminDao.findMember(searchVO);
//	}
	//총 소모임수
	@GetMapping("/clubcount")
	public int clubCount(){
		return adminDao.clubCount();
	}
	//소모임 리스트
	@GetMapping("/club/{column}/{order}")
	public List<ClubDto> clubList(@PathVariable String column, @PathVariable String order){
		return adminDao.clubList(column, order);
	}
	//소모임 멤버 리스트
	@GetMapping("/clubmember/{clubNo}")
	public List<ClubMemberListVO> clubMemberList(@PathVariable int clubNo){
		return adminDao.clubMemberList(clubNo);
	}
	//소모임 게시글 리스트
	@GetMapping("/clubboard/{column}/{order}/{clubNo}")
	public List<ClubBoardDto> clubBoardList(@PathVariable String column, @PathVariable String order, @PathVariable int clubNo){
		return adminDao.clubBoardList(column, order,clubNo);
	}
	//소모임 게시글 검색
	@PostMapping("/clubboard/")
	public List<ClubBoardDto> clubBoardSearch(@RequestBody AdminClubSearchVO searchVO){
		return adminDao.clubBoardSearch(searchVO);
	}
	//소모임 게시글 통계
	@GetMapping("/clubboardstat/{clubNo}")
	public List<ClubStatisticVO> stat(@PathVariable int clubNo) {
		return adminDao.clubBoardStat(clubNo);
	}
	//소모임 댓글 리스트
	@GetMapping("/clubreply/{clubNo}")
	public List<ClubBoardReplyDto> clubReplyList(@PathVariable int clubNo){
		return adminDao.clubReplyList(clubNo);
	}
	//소모임 검색
	@PostMapping("/club/")
	public List<ClubDto> clubSearch(@RequestBody AdminSearchVO searchVO){
		return adminDao.clubSearch(searchVO);
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
	//mbti 게시 목록
	@GetMapping("/mbtiboard/{column}/{order}")
	public List<MbtiBoardDto> mbtiBoardList(@PathVariable String column, @PathVariable String order){
		return adminDao.mbtiBoardList(column, order);
	}
	//mbti 검색
	@PostMapping("/mbtiboard")
	public List<MbtiBoardDto> findBoard(@RequestBody AdminSearchVO searchVO) {
		return adminDao.findBoard(searchVO);
	}
	//총 mbti 게시글 수
	@GetMapping("/mbtiboardcount")
	public int mbtiBoardCount(){
		return adminDao.mbtiBoardCount();
	}
	//등록
	@PostMapping("/mbtianimal")
	public int insert(
			@ModelAttribute MbtiAnimalDto mbtiAnimalDto, 
			@RequestParam MultipartFile file
			)throws IllegalStateException, IOException {
		return adminService.insertPhoto(mbtiAnimalDto , file);
	}	
	//mbti 동물 종류 리스트
	@GetMapping("/mbtianimal")
	public List<AdminMbtiAnimalListVO> mbtiAnimalList() {
		return adminDao.mbtiAnimalList();
	}
	//mbti 동물 삭제
	@DeleteMapping("/mbtianimal/{animalNo}")
	public int mbtiAnimalDelete(@PathVariable int animalNo) {
		return adminDao.mbtianimalDelete(animalNo);
	}

	
	
	
}
