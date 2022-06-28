package com.kh.e3i1.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.repository.ClubDao;

@CrossOrigin(
			origins = {"http://127.0.0.1:5500"}
		)
@RestController
@RequestMapping("/rest/club")
public class ClubRestController {
	
	@Autowired
	private ClubDao clubDao;
	
	@GetMapping("/")
	public List<ClubDto> list(){
		return clubDao.list();
	}
}
