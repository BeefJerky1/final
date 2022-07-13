package com.kh.e3i1.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.repository.ClubDao;
import com.kh.e3i1.vo.ClubListVO;
@CrossOrigin(origins = {"http://127.0.0.1:5500"})
@RestController 
@RequestMapping("/rest/home")
public class HomeRestController {

	@Autowired
	private ClubDao clubDao;
	
	// 상단 소모임 비동기 검색바 기능
	@GetMapping("/{keyword}")
	public List<ClubDto> search(@PathVariable String keyword) {
		return clubDao.search(keyword);
	}

	@GetMapping("/")
	public List<ClubListVO> list(){
		return clubDao.list();
	}
}
