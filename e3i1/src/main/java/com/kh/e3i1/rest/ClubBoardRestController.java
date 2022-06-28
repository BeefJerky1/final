package com.kh.e3i1.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.e3i1.entity.ClubBoardDto;
import com.kh.e3i1.repository.ClubBoardDao;

@RestController
@RequestMapping("/rest/clubboard")
@CrossOrigin(origins = {"http://127.0.0.1:5500"})
public class ClubBoardRestController {
	
	@Autowired
	private ClubBoardDao clubBoardDao;
	
	@GetMapping("/{clubNo}")
	public List<ClubBoardDto> list(@PathVariable int clubNo) {
		return clubBoardDao.list(clubNo);
	}
}
