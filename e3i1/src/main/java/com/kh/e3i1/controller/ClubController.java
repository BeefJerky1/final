package com.kh.e3i1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.e3i1.entity.CategoryDto;
import com.kh.e3i1.repository.CategoryDao;
import com.kh.e3i1.repository.ClubDao;

@Controller
@RequestMapping("/club")
public class ClubController {
	
	@Autowired
	private ClubDao clubDao;
	
	@Autowired
	private CategoryDao categoryDao;
	

	// 소모임 목록 
	@GetMapping("/")
	public String clubList(Model model) {
		return "club/list";
	}
	
	// 소모임 게시판 목록
	@GetMapping("/board")
	public String clubBoard() {
		return "club/board";
	}
}
