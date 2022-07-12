package com.kh.e3i1.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.e3i1.entity.NoticeDto;
import com.kh.e3i1.error.CannotFindException;
import com.kh.e3i1.repository.MemberDao;
import com.kh.e3i1.repository.NoticeDao;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@GetMapping("/list")
	public String list(
				@RequestParam(required = false) String type,
				@RequestParam(required = false) String keyword,
				@RequestParam(required = false, defaultValue = "1") int p,
				@RequestParam(required = false, defaultValue = "5") int s,
				Model model
			) {
		
		List<NoticeDto> list = noticeDao.list(type, keyword, p, s);
		model.addAttribute("list", list);
		
		boolean search = type != null && keyword != null;
		model.addAttribute("search", search);
		 
		int count = noticeDao.count(type, keyword);
		int lastPage = (count + s - 1) / s;
		
		int blockSize = 10;
		int endBlock = (p + blockSize - 1) / blockSize * blockSize;
		int startBlock = endBlock - (blockSize - 1);
		if(endBlock > lastPage){
			endBlock = lastPage;
		}
		
		model.addAttribute("p", p);
		model.addAttribute("s", s);
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("lastPage", lastPage);
		
		return "notice/list";
	}

	@GetMapping("/detail")
		public String detail(@RequestParam int noticeNo, Model model) {
			NoticeDto noticeDto = noticeDao.read(noticeNo);
			model.addAttribute("noticeDto", noticeDto);

			return "notice/detail";
		}
		
	@GetMapping("/detail/{noticeNo}")
	public String detail2(@PathVariable int noticeNo, Model model) {
		NoticeDto noticeDto = noticeDao.read(noticeNo);
		model.addAttribute("noticeDto", noticeDto);
		
		return "notice/detail";
	}	
	
	@GetMapping("/delete/{noticeNo}")
	public String delete(@PathVariable int noticeNo) {
		boolean success = noticeDao.delete(noticeNo);
		if(success) {
			return "redirect:/notice/list";
		}
		else {
			throw new CannotFindException();
		}
	}
	
	@GetMapping("/edit")
	public String edit(@RequestParam int noticeNo, Model model) {
		NoticeDto noticeDto = noticeDao.info(noticeNo);
		model.addAttribute("noticeDto", noticeDto);
		return "notice/edit";
	}
	

	@PostMapping("/edit")
	public String edit(
			@ModelAttribute NoticeDto noticeDto, 
			HttpServletResponse response,
			RedirectAttributes attr) {
		boolean success = noticeDao.edit(noticeDto);
		if(success) {
			attr.addAttribute("noticeNo", noticeDto.getNoticeNo());
			return "redirect:detail";
		}
		else {
			throw new CannotFindException();
		}
	}
	
	@GetMapping("/write")
	public String write() {
			
		return "notice/write";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute NoticeDto noticeDto,
									HttpSession session,
									RedirectAttributes attr) {
		
		int memberNo = (Integer) session.getAttribute("login");
		noticeDto.setMemberNo(memberNo);
		
		int noticeNo = noticeDao.write(noticeDto);
		
		attr.addAttribute("noticeNo", noticeNo);
		return "redirect:detail";
	}
}
