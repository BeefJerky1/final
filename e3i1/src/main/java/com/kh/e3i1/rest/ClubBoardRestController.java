package com.kh.e3i1.rest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.e3i1.entity.ClubBoardDto;
import com.kh.e3i1.repository.ClubBoardDao;

import lombok.extern.slf4j.Slf4j;
import springfox.documentation.annotations.ApiIgnore;

@Slf4j
@RestController
@RequestMapping("/rest/clubboard")
@CrossOrigin(origins = {"http://127.0.0.1:5500"})
public class ClubBoardRestController {
	
	@Autowired
	private ClubBoardDao clubBoardDao;
//	@Autowired
//	private MemberDao memberDao;
	
	@GetMapping("/{clubNo}")
	public List<ClubBoardDto> list(@PathVariable int clubNo) {
		return clubBoardDao.list(clubNo);
	}
	@PostMapping("/")
	public ClubBoardDto insert(
			@ApiIgnore HttpSession session, @RequestBody ClubBoardDto clubBoardDto) {
//		int memberNo = (Integer)session.getAttribute("login");
		int memberNo = 1;
		clubBoardDto.setClubBoardWriter(memberNo);
		log.info("clubBoardDto ={}",clubBoardDto);
		return clubBoardDao.insert(clubBoardDto);
	}
}
