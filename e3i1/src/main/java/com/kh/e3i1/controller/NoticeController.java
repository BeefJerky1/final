package com.kh.e3i1.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.e3i1.entity.NoticeDto;
import com.kh.e3i1.error.CannotFindException;
import com.kh.e3i1.repository.AttachmentDao;
import com.kh.e3i1.repository.MemberDao;
import com.kh.e3i1.repository.NoticeAttachDao;
import com.kh.e3i1.repository.NoticeDao;
import com.kh.e3i1.service.NoticeService;
import com.kh.e3i1.vo.NoticeDetailVO;
import com.kh.e3i1.vo.NoticeListVO;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.diagnostics.DebugFirstFailureClioSupport;

@Controller
@RequestMapping("/notice")
@Slf4j
public class NoticeController {

	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private MemberDao memberDao;

	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private NoticeAttachDao noticeAttachDao;
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/list")
	public String list(
				@RequestParam(required = false) String type,
				@RequestParam(required = false) String keyword,
				@RequestParam(required = false, defaultValue = "1") int p,
				@RequestParam(required = false, defaultValue = "5") int s,
				Model model,
				HttpSession session
			) {
		
		List<NoticeListVO> list = noticeDao.list(type, keyword, p, s);
		model.addAttribute("list", list);
		
		boolean search = type != null && keyword != null;
		model.addAttribute("search", search);
		 
		int count = noticeDao.count(type, keyword);
		int lastPage = (count + s - 1) / s;
		
		int blockSize = 5;
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
		
		//model.addAttribute("memberNo", (int)session.getAttribute("login"));
		//model.addAttribute("auth", session.getAttribute("auth"));
		return "notice/list";
	}

	@GetMapping("/detail")
		public String detail(@RequestParam int noticeNo, Model model) {
		NoticeDetailVO noticeDetailVO = noticeDao.read(noticeNo);
			model.addAttribute("detailVO", noticeDetailVO);

			return "notice/detail";
		}
		
//	@GetMapping("/detail/{noticeNo}")
//	public String detail2(@PathVariable int noticeNo, Model model) {
//		NoticeDetailVO noticeDetailVO = noticeDao.read(noticeNo);
//		model.addAttribute("detailVO", noticeDetailVO);
//		
//		return "notice/detail";
//	}	
	
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
			@RequestParam MultipartFile attachment,
			@RequestParam int attachNo,
			RedirectAttributes attr) throws IllegalStateException, IOException {
		
		boolean success = noticeService.edit(noticeDto, attachment, attachNo);
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
						@RequestParam MultipartFile noticeAttach,
									HttpSession session,
									RedirectAttributes attr) throws IllegalStateException, IOException {
		
		
		int memberNo = (Integer) session.getAttribute("login");
		noticeDto.setMemberNo(memberNo);
		noticeService.write(noticeDto, noticeAttach);	
		attr.addAttribute("noticeNo", noticeDto.getNoticeNo());
		
		
		return "redirect:detail";
	}
}
