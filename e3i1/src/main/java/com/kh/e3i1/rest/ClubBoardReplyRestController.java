package com.kh.e3i1.rest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.kh.e3i1.repository.ClubBoardReplyDao;

import springfox.documentation.annotations.ApiIgnore;

@RestController
@RequestMapping("/rest/clubboardreply")
public class ClubBoardReplyRestController {
	@Autowired
	private ClubBoardReplyDao clubBoardReplyDao;
	
	
	@PostMapping("/")
	public ClubBoardReplyDto insert(
			@ApiIgnore HttpSession session, @RequestBody ClubBoardReplyDto clubBoardReplyDto) {
//		int replyWriter = (Integer)session.getAttribute("login");
		int replyWriter = 3;
		clubBoardReplyDto.setClubReplyWriter(replyWriter);
		return clubBoardReplyDao.insert(clubBoardReplyDto);
	}
	
	@GetMapping("/{clubBoardNo}")
	public List<ClubBoardReplyDto> list(@PathVariable int clubBoardNo) {
		return clubBoardReplyDao.list(clubBoardNo);
	}
	@DeleteMapping("/{replyNo}")
	public void delete(@PathVariable int replyNo) {
		clubBoardReplyDao.delete(replyNo);
	}
	@PutMapping("/")
	public ClubBoardReplyDto edit(@RequestBody ClubBoardReplyDto clubBoardReplyDto) {
		return clubBoardReplyDao.edit(clubBoardReplyDto);
	}
}

