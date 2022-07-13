package com.kh.e3i1.rest;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
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

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.ClubLikeDto;
import com.kh.e3i1.entity.ClubMemberDto;
import com.kh.e3i1.repository.AttachmentDao;
import com.kh.e3i1.repository.ClubDao;
import com.kh.e3i1.repository.ClubMemberDao;
import com.kh.e3i1.service.ClubService;
import com.kh.e3i1.vo.ClubComplexSearchVO;
import com.kh.e3i1.vo.ClubDetailVO;
import com.kh.e3i1.vo.ClubListVO;
import com.kh.e3i1.vo.ClubMemberListVO;

@CrossOrigin(
			origins = {"http://127.0.0.1:5500"}
		)
@RestController
@RequestMapping("/rest/club")
public class ClubRestController {
	
	@Autowired
	private ClubDao clubDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private ClubService clubService;
	
	@Autowired
	private ClubMemberDao clubMemberDao;
	
	// 소모임 목록 
	@GetMapping("/{page}")
	public List<ClubListVO> list(
			@PathVariable int page
			){
		return clubDao.list(page);
	}
	
	// 소모임 검색
	@PostMapping("/search")
	public List<ClubListVO> searchList(
			@RequestBody ClubComplexSearchVO clubComplexSearchVO
			){
		return clubDao.searchList(clubComplexSearchVO);
	}
	
	// 소모임 생성
	@PostMapping("/")
	public int createClub(
			@ModelAttribute ClubDto clubDto, 
			@RequestParam MultipartFile clubProfile
			) throws IllegalStateException, IOException {
		return clubService.createClub(clubDto, clubProfile);
	}
	
	// 소모임 상세페이지
	@GetMapping("/detail/{clubNo}")
	public ClubDetailVO clubDetail(@PathVariable int clubNo) {
		return clubDao.detail(clubNo);
	}
	
	// 소모임 회원 전체목록
	@GetMapping("/member/{clubNo}")
	public List<ClubMemberListVO> memberList(@PathVariable int clubNo){
		return clubMemberDao.select(clubNo);
	}
	
	// 소모임 가입 신청
	@PostMapping("/member")
	public int insertClubMember(@RequestBody ClubMemberDto clubMemberDto) {
		return clubMemberDao.insert(clubMemberDto);
	}
	
	// 소모임 좋아요
	@PostMapping("/like")
	public int likeClub(@RequestBody ClubLikeDto clubLikeDto) {
		return clubDao.likeClub(clubLikeDto);
	}
	
	// 소모임 좋아요 여부 확인
	@GetMapping("/is_like/{clubNo}/{memberNo}")
	public boolean isLike(@PathVariable int clubNo, @PathVariable int memberNo) {
		return clubDao.isLike(clubNo, memberNo);
	}
	
	// 소모임 정보 변경 with file
	@PostMapping("/edit")
	public int editClub(
			@ModelAttribute ClubDto clubDto,
			@RequestParam MultipartFile clubProfile,
			@RequestParam int attachNo
			) throws IllegalStateException, IOException {
		return clubService.editClub(clubDto, clubProfile, attachNo);
	}
	
	// 소모임 정보 변경 without file
	@PutMapping("/edit2")
	public int editClub(@RequestBody ClubDto clubDto) {
		return clubDao.editClub(clubDto);
	}
	
	// 소모임 가입 승인 
	@PutMapping("/approve")
	public int approveClub(@RequestBody ClubMemberDto clubMemberDto) {
		return clubMemberDao.approveClub(clubMemberDto.getClubMemberNo());
	}
	
	// 소모임 가입 거절
	@PutMapping("/refuse")
	public int refuseClub(@RequestBody ClubMemberDto clubMemberDto) {
		return clubMemberDao.refuseClub(clubMemberDto);
	}
	
}







