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
import com.kh.e3i1.repository.ClubBoardDao;
import com.kh.e3i1.repository.ClubBoardLikeDao;
import com.kh.e3i1.vo.ClubBoardListItemVO;

import springfox.documentation.annotations.ApiIgnore;


@RestController
@RequestMapping("/rest/clubboard")
@CrossOrigin(origins = {"http://127.0.0.1:5500"})
public class ClubBoardRestController {
	
	@Autowired
	private ClubBoardDao clubBoardDao;
	@Autowired
	private ClubBoardLikeDao clubBoardLikeDao;
//	@Autowired
//	private MemberDao memberDao;
	
	//오른쪽 사이드바 목록
	@GetMapping("/side/{clubNo}/order/{orderType}")
	public List<ClubBoardDto> Sidelist(@PathVariable int clubNo , @PathVariable String orderType) {
		return clubBoardDao.list(clubNo,orderType);
	}
	//목록
	@GetMapping("/{clubNo}")
	public List<ClubBoardListItemVO> list(@PathVariable int clubNo) {
		return clubBoardDao.listAll(clubNo);
	}
	//등록
	@PostMapping("/")
	public ClubBoardDto insert(@ApiIgnore HttpSession session, @RequestBody ClubBoardDto clubBoardDto) {
		int clubBoardWriter = 3;
		clubBoardDto.setClubBoardWriter(clubBoardWriter);
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
	@GetMapping("/like/{clubBoardNo}/{likeMemberNo}")
	public int select(@ApiIgnore HttpSession session,@PathVariable int clubBoardNo,@PathVariable int likeMemberNo) {
//		int likeMemberNo = (Integer)session.getAttribute("login");
		return clubBoardLikeDao.findLike(clubBoardNo, likeMemberNo);
	}
	@PostMapping("/like")
	public ClubBoardLikeDto insert(@ApiIgnore HttpSession session, @RequestBody ClubBoardLikeDto clubBoardLikeDto ) {
		int MemberNo = (Integer)session.getAttribute("login");
		clubBoardLikeDto.setLikeMemberNo(MemberNo);
		return clubBoardLikeDao.insert(clubBoardLikeDto);
	}
	@DeleteMapping("/like")
	public void delete(@ApiIgnore HttpSession session, @RequestBody ClubBoardLikeDto clubBoardLikeDto) {
		int MemberNo = (Integer)session.getAttribute("login");
		clubBoardLikeDto.setLikeMemberNo(MemberNo);
		clubBoardLikeDao.delete(clubBoardLikeDto);
	}
//	@PostMapping("/replylike")
//	public ClubReplyLikeDto insert(@ApiIgnore HttpSession session, @RequestBody ClubReplyLikeDto clubReplyLikeDto) {
//		int memberNo = 3;
//		clubReplyLikeDto.setMemberNo(memberNo);
//		return clubReplyLikeDao.insert(clubReplyLikeDto);
//	}
}
