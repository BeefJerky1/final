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

import com.kh.e3i1.entity.ClubBoardAttachDto;
import com.kh.e3i1.entity.ClubBoardDto;
import com.kh.e3i1.entity.ClubBoardLikeDto;
import com.kh.e3i1.entity.ClubBoardReportDto;
import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.ClubMemberDto;
import com.kh.e3i1.entity.ClubReplyLikeDto;
import com.kh.e3i1.entity.MessageDto;
import com.kh.e3i1.repository.ClubBoardDao;
import com.kh.e3i1.repository.ClubBoardLikeDao;
import com.kh.e3i1.repository.ClubMemberDao;
import com.kh.e3i1.repository.ClubReportDao;
import com.kh.e3i1.repository.MessageDao;
import com.kh.e3i1.service.ClubBoardService;
import com.kh.e3i1.vo.ClubBoardListItemVO;
import com.kh.e3i1.vo.ClubDetailVO;
import com.kh.e3i1.vo.ClubMemberProfileVO;

import springfox.documentation.annotations.ApiIgnore;


@RestController
@RequestMapping("/rest/clubboard")
@CrossOrigin(origins = {"http://127.0.0.1:5500"})
public class ClubBoardRestController {
	
	@Autowired
	private ClubBoardDao clubBoardDao;
	@Autowired
	private ClubBoardLikeDao clubBoardLikeDao;
	@Autowired
	private ClubReportDao clubReportDao;
	@Autowired
	private ClubBoardService clubBoardService; 
	@Autowired
	private ClubMemberDao clubMemberDao;
	@Autowired
	private MessageDao messageDao;
	
	//오른쪽 사이드바 목록
	@GetMapping("/side/{clubNo}/order/{orderType}/{memberNo}")
	public List<ClubBoardDto> Sidelist(
			@PathVariable int clubNo , 
			@PathVariable String orderType,
			@PathVariable int memberNo
			) {
		return clubBoardDao.list(clubNo,orderType,memberNo);
	}
	//목록
	@GetMapping("/{clubNo}/{likeMemberNo}/{column}/{order}")
	public List<ClubBoardListItemVO> list(@PathVariable int clubNo, 
			@PathVariable int likeMemberNo,
			@PathVariable String column,
			@PathVariable String order) {
		return clubBoardDao.listAll(clubNo,likeMemberNo, column, order);
	}
	//등록
	@PostMapping("/")
	public ClubBoardDto insert(@ModelAttribute ClubBoardDto clubBoardDto, 
			@RequestParam(required=false) List<MultipartFile> files)throws IllegalStateException, IOException {
		return clubBoardService.insert(clubBoardDto , files);
	}	
	//삭제
	@DeleteMapping("/{clubBoardNo}")
	public void delete(@PathVariable int clubBoardNo) {
		//게시글 사진 확인
		List<ClubBoardAttachDto> list = clubBoardDao.getAttachNo(clubBoardNo);
		if(list!=null) {
			for(ClubBoardAttachDto dto:list) {
				 boolean success = clubBoardDao.deleteAttachNo(dto.getAttachNo());
				 if(success) {
					 clubBoardDao.delete(clubBoardNo);
					 
				 }
			}
		}
	}
	//상세 보기
	@GetMapping("/detail/{clubBoardNo}/memberNo/{memberNo}")
	public ClubBoardListItemVO one(@PathVariable int clubBoardNo ,@PathVariable int memberNo) {	
		return clubBoardDao.detail(clubBoardNo, memberNo);
	}
	
	//수정
	@PostMapping("/editBoard")
	public ClubBoardDto edit(
			@ModelAttribute ClubBoardDto clubBoardDto , 
			@RequestParam(required=false) List<MultipartFile> files
			) throws IllegalStateException, IOException {
		return clubBoardService.editClubBoard(clubBoardDto, files);
	}
	//게시글 사진번호 가져오기
	@GetMapping("/attach/{clubBoardNo}")
	public List<ClubBoardAttachDto> getAttachNo(@PathVariable int clubBoardNo){
		return clubBoardDao.getAttachNo(clubBoardNo);
	}
	//게시글 사진 삭제
	@DeleteMapping("/attach/{attachNo}")
	public boolean deleteAttachNo(@PathVariable int attachNo){
		return clubBoardDao.deleteAttachNo(attachNo);
	}
	//좋아요 확인
	@GetMapping("/likecheck/{clubBoardNo}/{likeMemberNo}")
	public int select(@ApiIgnore HttpSession session,@PathVariable int clubBoardNo,@PathVariable int likeMemberNo) {
		return clubBoardLikeDao.findLike(clubBoardNo, likeMemberNo);
	}
	//좋아요 등록
	@PostMapping("/like")
	public ClubBoardLikeDto insert(@ApiIgnore HttpSession session, @RequestBody ClubBoardLikeDto clubBoardLikeDto ) {
		int MemberNo = (Integer)session.getAttribute("login");
		clubBoardLikeDto.setLikeMemberNo(MemberNo);
		return clubBoardLikeDao.insert(clubBoardLikeDto);
	}
	//좋아요 취소
	@DeleteMapping("/like")
	public void delete(@ApiIgnore HttpSession session, @RequestBody ClubBoardLikeDto clubBoardLikeDto) {
		int MemberNo = (Integer)session.getAttribute("login");
		clubBoardLikeDto.setLikeMemberNo(MemberNo);
		clubBoardLikeDao.delete(clubBoardLikeDto);
	}
	//게시글 목록에서 좋아요 조회
	@GetMapping("/likeList/{clubBoardNo}/{likeMemberNo}")
	public int select2(@PathVariable int clubBoardNo ,@PathVariable int likeMemberNo) {
		return clubBoardLikeDao.findLikeList(clubBoardNo,likeMemberNo);
	}
	//모달창에서 프로필 조회
	@GetMapping("/modal/{memberNo}")
	public ClubMemberProfileVO memberProfile(@PathVariable int memberNo) {
		return clubBoardDao.memberProfile(memberNo);
	}
	//게시글 신고접수
	@PostMapping("/report")
	public int clubBoardReport(@RequestBody ClubBoardReportDto clubBoardReportDto) {
		return clubReportDao.reportBoard(clubBoardReportDto);
	}
	//신고 확인//게시글 상세조회
	@GetMapping("/reportcheck/{clubReportTarget}/{clubReportReporter}")
	public int searchReport(@ApiIgnore HttpSession session,@PathVariable int clubReportTarget,@PathVariable int clubReportReporter) {
		return clubReportDao.findBoardReport(clubReportTarget, clubReportReporter);
	}
	//소모임 멤버 확인
	@GetMapping("/member/{clubNo}/{memberNo}")
	public int verify(@PathVariable int clubNo, @PathVariable int memberNo){
		return clubMemberDao.check(clubNo, memberNo);		
	}
	//메세지 작성
	@PostMapping("/message")
	public int sendMessage(@RequestBody MessageDto messageDto) {
		return messageDao.sendMessage1(messageDto);
	}
	//게시글 상세페이지에서 클럽정보 불러오기
	@GetMapping("/clubDetail/{clubBoardNo}")
	public ClubDetailVO clubDetail(@PathVariable int clubBoardNo) {
		return clubBoardDao.clubDetail(clubBoardNo);
	}
	
}
