package com.kh.e3i1.controller;


import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.e3i1.entity.AttachmentDto;
import com.kh.e3i1.entity.ClubBoardDto;
import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.repository.AttachmentDao;
import com.kh.e3i1.repository.ClubBoardDao;
import com.kh.e3i1.repository.ClubDao;
import com.kh.e3i1.vo.ClubBoardListItemVO;

@Controller
@RequestMapping("/club")
public class ClubController {
	
	@Autowired
	private ClubDao clubDao;
	@Autowired
	private ClubBoardDao clubBoardDao;
	@Autowired
	private AttachmentDao attachmentDao;
	
	// 소모임 목록 
	@GetMapping("/")
	public String clubList() {
		return "club/list";
	}
	// 소모임 상세페이지
	@GetMapping("/detail")
	public String clubDetail(@RequestParam int clubNo) {
		return "club/detail_main";
	}
	// 소모임 채팅방
	@GetMapping("/chat")
	public String clubChat(@RequestParam int clubNo) {
		return "club/detail_chat";
	}
	// 소모임 관리페이지
	@GetMapping("/edit")
	public String clubEdit(@RequestParam int clubNo) {
		return "club/detail_edit";
	}
	// 소모임 관리페이지
	@GetMapping("/member_management")
	public String clubMemberManagement(@RequestParam int clubNo) {
		return "club/detail_member_management";
	}
	
	
	
	// 소모임 게시판 목록
	@GetMapping("/board")
	public String clubBoard(@RequestParam int clubNo ) {
//		clubBoardDao.list(clubNo);
		return "club/board";
	}
	// 소모임 게시판 상세
	@GetMapping("/board_detail")
	public String clubBoardDetail(@RequestParam int clubBoardNo, Model model) {
		ClubBoardListItemVO clubBoardListItemVO= clubBoardDao.detail(clubBoardNo);
		ClubBoardDto clubBoardDto = clubBoardDao.readcount(clubBoardNo);
		model.addAttribute(clubBoardListItemVO);
		return "club/board_detail";
	}

}
