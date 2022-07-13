package com.kh.e3i1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.repository.ClubDao;
import com.kh.e3i1.vo.ClubDetailVO;
import com.kh.e3i1.vo.ClubListVO;

@Controller
@RequestMapping("/template")
public class HeaderController {
	
	@Autowired
	private ClubDao clubDao;
	
	
	@GetMapping("/club/detail")
	public String detail(@RequestParam int clubNo, Model model) {
		ClubDetailVO clubDetailVO = clubDao.detail(clubNo);
		model.addAttribute("clubDetailVO", clubDetailVO);
		
		return "club/detail";
		
	}
	
	@PostMapping("/club/detail/{clubNo}")
	public String detail2(@PathVariable int clubNo, Model model) {
		
		ClubDetailVO clubDetailVO = clubDao.detail(clubNo);
		model.addAttribute("clubDetailVO", clubDetailVO);
		
		return "club/detail";
	}
	
}