package com.kh.e3i1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.e3i1.entity.ClubBoardDto;
import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.repository.ClubBoardDao;
import com.kh.e3i1.repository.ClubDao;

@Controller
@RequestMapping("/club")
public class ClubController {
	
	@Autowired
	private ClubDao clubDao;
	@Autowired
	private ClubBoardDao clubBoardDao;
	// 소모임 목록 
	@GetMapping("/")
	public String clubList() {
		return "club/list";
	}
	
	// 소모임 게시판 목록
	@GetMapping("/board/{clubNo}")
	public String clubBoard(@PathVariable int clubNo) {
		clubBoardDao.list(clubNo);
		return "club/board";
	}
	// 소모임 게시판 상세
	@GetMapping("/board_detail")
	public String clubBoardDetail(@RequestParam int clubBoardNo, Model model) {
		ClubBoardDto clubBoardDto = clubBoardDao.selectOne(clubBoardNo);
		model.addAttribute(clubBoardDto);
		return "club/board_detail";
	}
//	// 소모임 게시글 삭제
//	@GetMapping("/delete")
//	public String delete(@RequestParam int clubBoardNo) {
//		boolean success = clubBoardDao.delete(clubBoardNo);
//		if(success) {
//			return "club/board";			
//		}else {
//			return "club/board";
//		}
//	}
}
