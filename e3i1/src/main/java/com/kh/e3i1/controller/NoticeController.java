//package com.kh.e3i1.controller;
//
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.kh.e3i1.entity.NoticeDto;
//import com.kh.e3i1.error.CannotFindException;
//import com.kh.e3i1.repository.MemberDao;
//import com.kh.e3i1.repository.NoticeDao;
////import com.kh.home.entity.BoardDto;
//
//@Controller
//@RequestMapping("/notice")
//public class NoticeController {
//
//	@Autowired
//	private NoticeDao noticeDao;
//	
//	@Autowired
//	private MemberDao memberDao;
//	
//	@GetMapping("/list")
//	public String list(
//				@RequestParam(required = false) String type,
//				@RequestParam(required = false) String keyword,
//				@RequestParam(required = false, defaultValue = "1") int p,
//				@RequestParam(required = false, defaultValue = "10") int s,
//				Model model
//			) {
//		
//		List<NoticeDto> list = noticeDao.list(type, keyword, p, s);
//		model.addAttribute("list", list);
//		
//		boolean search = type != null && keyword != null;
//		model.addAttribute("search", search);
//		 
//		int count = noticeDao.count(type, keyword);
//		int lastPage = (count + s - 1) / s;
//		
//		int blockSize = 10;
//		int endBlock = (p + blockSize - 1) / blockSize * blockSize;
//		int startBlock = endBlock - (blockSize - 1);
//		if(endBlock > lastPage){
//			endBlock = lastPage;
//		}
//		
//		model.addAttribute("p", p);
//		model.addAttribute("s", s);
//		model.addAttribute("type", type);
//		model.addAttribute("keyword", keyword);
//		model.addAttribute("startBlock", startBlock);
//		model.addAttribute("endBlock", endBlock);
//		model.addAttribute("lastPage", lastPage);
//		
//		return "notice/list";
//	}
//
//	@GetMapping("/detail/{noticeNo}")
//	public String detail(
//			@RequestParam int noticeNo, Model model, HttpSession session) {
//		NoticeDto noticeDto = noticeDao.read(noticeNo);
//		model.addAttribute("noticeDto", noticeDto);
//		
//		//관리자인지 판정
////		String memberAdmin = (String)session.getAttribute("auth");
////		boolean isAdmin = memberAdmin != null && memberAdmin.equals("관리자");
////		model.addAttribute("isAdmin", isAdmin);
//		
//		return "notice/detail";
//	}
//	
//	@GetMapping("/delete/{noticeNo}")
//	public String delete(@RequestParam int noticeNo) {
//		boolean success = noticeDao.delete(noticeNo);
//		if(success) {
//			return "redirect:list";
//		}
//		else {
//			throw new CannotFindException();
//		}
//	}
//	
//	@GetMapping("/edit/{boardNo}")
//	public String edit(@PathVariable int noticeNo, Model model) {
//		NoticeDto noticeDto = noticeDao.info(noticeNo);
//		model.addAttribute("noticeDto", noticeDto);
//		return "board/edit"; 
//	}
//}
//
