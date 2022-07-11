package com.kh.e3i1.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.repository.AdminDao;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminDao adminDao;
	@GetMapping("/")
	public String adminHome() {
		return "admin/main";
	}
	@GetMapping("/member")
	public String member() {
		return "admin/member";
	}
	@GetMapping("/member_detail")
	public String memberDetail(@RequestParam int memberNo, Model model) {
		MemberDto memberDto = adminDao.oneMember(memberNo);
		model.addAttribute("memberDto", memberDto);
		return "admin/member_detail";
	}
	@PostMapping("/memberInformation")
	public String changeMemberInformation(@ModelAttribute MemberDto memberDto) {
		
		boolean success = adminDao.changeMember(memberDto);
		if(success) {
			return "redirect:member";
		}
		else {
			return "redirect:information?error";
		}
	}
	@GetMapping("/member_chart")
	public String memberChart() {
		return "admin/member_chart";
	}
	@GetMapping("/member_search")
	public String memberSearch() {
		return "admin/member_search";
	}
	@GetMapping("/club")
	public String club() {
		return "admin/club";
	}
	@GetMapping("/club_detail")
	public String clubDetail(@RequestParam int clubNo, Model model) {
		ClubDto clubDto = adminDao.oneClub(clubNo);
		model.addAttribute("clubDto", clubDto);
		return "admin/club_detail";
	}
	@PostMapping("/clubInformation")
	public String changeClubInformation(@ModelAttribute ClubDto clubDto) {
		
		boolean success = adminDao.changeClub(clubDto);
		if(success) {
			return "redirect:club";
		}
		else {
			return "redirect:information?error";
		}
	}
	@GetMapping("/mbtiboard")
	public String MbtiBoard() {
		return "admin/mbtiboard";
	}
	@GetMapping("/mbtisurvey")
	public String MbtiSurvey() {
		return "admin/mbtisurvey";
	}
}
