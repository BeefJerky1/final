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

import com.kh.e3i1.entity.ClubBoardReplyDto;
import com.kh.e3i1.entity.ClubReplyLikeDto;
import com.kh.e3i1.entity.ClubReplyReportDto;
import com.kh.e3i1.repository.ClubBoardReplyDao;
import com.kh.e3i1.repository.ClubReplyLikeDao;
import com.kh.e3i1.repository.ClubReportDao;
import com.kh.e3i1.vo.ClubBoardReplyListVO;

import springfox.documentation.annotations.ApiIgnore;

@RestController
@RequestMapping("/rest/clubboardreply")
@CrossOrigin(origins = {"http://127.0.0.1:5500"})
public class ClubBoardReplyRestController {
	@Autowired
	private ClubBoardReplyDao clubBoardReplyDao;
	@Autowired
	private ClubReplyLikeDao clubReplyLikeDao;
	@Autowired
	private ClubReportDao clubReportDao;
	
	@PostMapping("/")
	public ClubBoardReplyDto insert(
			@ApiIgnore HttpSession session, @RequestBody ClubBoardReplyDto clubBoardReplyDto) {
		return clubBoardReplyDao.insert(clubBoardReplyDto);
	}
	
	@GetMapping("/{clubBoardNo}/{likeMemberNo}")
	public List<ClubBoardReplyListVO> list(@PathVariable int clubBoardNo,@PathVariable int likeMemberNo) {
		return clubBoardReplyDao.listAll(clubBoardNo,likeMemberNo);
	}
	@DeleteMapping("/{replyNo}")
	public void delete(@PathVariable int replyNo) {
		clubBoardReplyDao.delete(replyNo);
	}
	@PutMapping("/")
	public ClubBoardReplyDto edit(@RequestBody ClubBoardReplyDto clubBoardReplyDto) {
		return clubBoardReplyDao.edit(clubBoardReplyDto);
	}
	@PostMapping("/like")
	public ClubReplyLikeDto insert(@ApiIgnore HttpSession session, @RequestBody ClubReplyLikeDto clubReplyLikeDto) {
		return clubReplyLikeDao.insert(clubReplyLikeDto);
	}
	@DeleteMapping("/like")
	public void delete(@ApiIgnore HttpSession session, @RequestBody ClubReplyLikeDto clubReplyLikeDto) {
		clubReplyLikeDao.delete(clubReplyLikeDto);
	}
	@GetMapping("/report/{replyNo}")
	public ClubBoardReplyListVO reportInfo(@ApiIgnore HttpSession session, @PathVariable int replyNo ) {
		return clubBoardReplyDao.reportInfo(replyNo);
	}
	@PostMapping("/report")
	public int reportReply(@ApiIgnore HttpSession session, @RequestBody ClubReplyReportDto clubReplyReportDto) {
		return clubReportDao.reportReply(clubReplyReportDto);
	}
}

