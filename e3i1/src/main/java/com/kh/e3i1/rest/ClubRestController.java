package com.kh.e3i1.rest;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.kh.e3i1.vo.PurchaseListVO;
import com.kh.e3i1.vo.ClubMemberProfileVO;

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
	@GetMapping("/{page}/{orderType}")
	public List<ClubListVO> list(
			@PathVariable int page,
			@PathVariable String orderType
			){
		return clubDao.list(page, orderType);
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
	
	// 소모임 신청 회원 전체목록
	@GetMapping("/member_permission/{clubNo}")
	public List<ClubMemberListVO> memberPermissionList(@PathVariable int clubNo){
		return clubMemberDao.selectPermission(clubNo);
	}
	
	// 소모임 가입 신청
	@PostMapping("/member")
	public int insertClubMember(@RequestBody ClubMemberDto clubMemberDto) {
		return clubMemberDao.insert(clubMemberDto);
	}
	
	// 소모임 탈퇴
	@DeleteMapping("/member/{memberNo}/{clubNo}")
	public int deleteClubMember(
				@PathVariable int memberNo,
				@PathVariable int clubNo
			) {
		ClubDetailVO detail = clubDao.detail(clubNo);
		if(memberNo == detail.getClubDto().getClubLeader()) {
			ClubDto clubDto = new ClubDto();
			clubDto.setClubNo(clubNo);
			clubService.passLeader(clubDto);
		}
		return clubMemberDao.delete(memberNo, clubNo);
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
	
	// 소모임 결제
//	@PostMapping("/pay")
//	public int clubPayment(@ModelAttribute PurchaseListVO listVO) {
//		return 
//	}
	
	// 회원 목록 프로필-> 프로필 조회
	@GetMapping("/modal/{memberNo}")
	public ClubMemberListVO memberProfile(@PathVariable int memberNo) {
		return clubMemberDao.memberProfile(memberNo);
	}
	
	@GetMapping("/is_club_member/{clubNo}/{memberNo}")
	public ClubMemberDto isClubMember(
			@PathVariable int clubNo,
			@PathVariable int memberNo,
			HttpSession session) {
		System.out.println("왜");
		System.out.println("왜");
		System.out.println("왜");
		System.out.println("왜");
		System.out.println(clubNo);
		System.out.println(memberNo);
		return clubDao.isClubMember(clubNo, memberNo);
	}
}







