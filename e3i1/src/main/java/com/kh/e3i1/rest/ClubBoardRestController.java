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
import com.kh.e3i1.repository.ClubBoardDao;

import springfox.documentation.annotations.ApiIgnore;


@RestController
@RequestMapping("/rest/clubboard")
@CrossOrigin(origins = {"http://127.0.0.1:5500"})
public class ClubBoardRestController {
	
	@Autowired
	private ClubBoardDao clubBoardDao;
//	@Autowired
//	private MemberDao memberDao;
	
	//목록
	@GetMapping("/{clubNo}")
	public List<ClubBoardDto> list(@PathVariable int clubNo) {
		return clubBoardDao.list(clubNo);
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
	public ClubBoardDto one(@PathVariable int clubBoardNo) {
		return clubBoardDao.selectOne(clubBoardNo);
	}
	//수정
	@PutMapping("/")
	public ClubBoardDto edit(@RequestBody ClubBoardDto clubBoardDto) {
		return clubBoardDao.edit(clubBoardDto);
	}
}