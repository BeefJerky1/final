package com.kh.e3i1.rest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.e3i1.entity.ClubBoardDto;
import com.kh.e3i1.entity.ClubBoardLikeDto;
import com.kh.e3i1.entity.ClubReplyLikeDto;
import com.kh.e3i1.entity.ClubReportDto;
import com.kh.e3i1.repository.ClubBoardDao;
import com.kh.e3i1.repository.ClubBoardLikeDao;
import com.kh.e3i1.repository.ClubReportDao;
import com.kh.e3i1.vo.ClubBoardListItemVO;
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
//	private MemberDao memberDao;
	
	//오른쪽 사이드바 목록
	@GetMapping("/side/{clubNo}/order/{orderType}")
	public List<ClubBoardDto> Sidelist(@PathVariable int clubNo , @PathVariable String orderType) {
		return clubBoardDao.list(clubNo,orderType);
	}
	//목록
	@GetMapping("/{clubNo}/likeMemberNo/{likeMemberNo}")
	public List<ClubBoardListItemVO> list(@PathVariable int clubNo, @PathVariable int likeMemberNo) {
		return clubBoardDao.listAll(clubNo,likeMemberNo);
	}
	//등록
	@PostMapping("/")
	public ClubBoardDto insert(@ApiIgnore HttpSession session, @RequestBody ClubBoardDto clubBoardDto) {
		return clubBoardDao.insert(clubBoardDto);
	}	
	//삭제
	@DeleteMapping("/{clubBoardNo}")
	public void delete(@PathVariable int clubBoardNo) {
		clubBoardDao.delete(clubBoardNo);
	}
	//상세 보기
	@GetMapping("/detail/{clubBoardNo}")
	public ClubBoardListItemVO one(@PathVariable int clubBoardNo) {	
		return clubBoardDao.detail(clubBoardNo);
	}
	//수정
	@PutMapping("/")
	public ClubBoardDto edit(@RequestBody ClubBoardDto clubBoardDto) {
		return clubBoardDao.edit(clubBoardDto);
	}
	//좋아요 확인
	@GetMapping("/likecheck/{clubBoardNo}/{likeMemberNo}")
	public int select(@ApiIgnore HttpSession session,@PathVariable int clubBoardNo,@PathVariable int likeMemberNo) {
//		int likeMemberNo = (Integer)session.getAttribute("login");
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
	public int clubBoardReport(@RequestBody ClubReportDto clubReportDto) {
		return clubReportDao.reportBoard(clubReportDto);
	}
	//신고 확인//게시글 상세조회
	@GetMapping("/reportcheck/{clubReportTarget}/{clubReportReporter}")
	public int searchReport(@ApiIgnore HttpSession session,@PathVariable int clubReportTarget,@PathVariable int clubReportReporter) {
//		int clubReportReporter = (Integer)session.getAttribute("login");
		return clubReportDao.findReport(clubReportTarget, clubReportReporter);
	}
	
}
