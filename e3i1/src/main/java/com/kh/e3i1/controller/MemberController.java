package com.kh.e3i1.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.e3i1.entity.MbtiSurveyDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.repository.MbtiSurveyDao;
import com.kh.e3i1.repository.MemberDao;

@Controller
@RequestMapping("/member")
public class MemberController {

	// 의존성 주입
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MbtiSurveyDao mbtiSurveyDao;
	
//	@Autowired
//	private EmailService emailService;
//	
//	@Autowired
//	private CertDao certDao;
	
	// 회원가입
	@GetMapping("/join")
	public String join(Model model) {
		
		List<MbtiSurveyDto> list = mbtiSurveyDao.select();
		model.addAttribute("list", list);
		return "member/join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute MemberDto memberDto) throws Exception {
//		memberDao.join(memberDto);
		
		return "redirect:/member/join_success";
	}
	
	@RequestMapping("/join_success")
	public String joinSuccess() {
		return "member/join_success";
	}
	
	// 로그인
	@GetMapping("/login")
	public String login(
			@RequestHeader(value="Referer", defaultValue = "/") String referer,
			Model model
	) {
		model.addAttribute("referer", referer);
		return "member/login";
	}
	
	@PostMapping("/login")
	public String login(
			@RequestParam String memberEmail, 
			@RequestParam String memberPw,
			@RequestParam String referer,
			@RequestParam(required=false) String remember,
			HttpSession session, 
			HttpServletResponse response) {
		
		MemberDto memberDto = memberDao.login(memberEmail, memberPw);
		
		if(memberDto != null) {
			session.setAttribute("login", memberDto.getMemberEmail());
			if(memberDto.getMemberAdmin()==1) {
				session.setAttribute("auth", "관리자");
				
			}
			
			if(remember != null) {
				Cookie ck = new Cookie("saveEmail", memberDto.getMemberEmail());
				ck.setMaxAge(4 * 7 * 24 * 60 * 60);//4주
				response.addCookie(ck);
			}
			else {
				Cookie ck = new Cookie("saveEmail", memberDto.getMemberEmail());
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			return "redirect:" + referer;
		}
		else {
			return "redirect:login?error";
		}
	}
	
	// 이메일 찾기
	@GetMapping("/find_email")
	public String findEmail() {
		return "member/find_email";
	}
	
	@PostMapping("/find_email")
	public String findEmail(
			@ModelAttribute MemberDto memberDto,
			HttpSession session,
			Model model) {
		String memberEmail = memberDao.findEmail(memberDto);
		if(memberEmail == null) {
			return "redirect:find_email?error";
		}
		else {
			model.addAttribute("findUserEmail", memberEmail);
			return "member/find_email_result";
		}
	}
	
	//비밀번호 찾기
	@GetMapping("/find_pw")
	public String findPw() {
		return "member/find_pw";
	}
	
//	@PostMapping("/find_pw")
//	public String findPw(@ModelAttribute MemberDto memberDto) throws MessagingException {
//		MemberDto findDto = memberDao.findPw(memberDto);
//		if(findDto == null) {
//			return "redirect:find_pw?error";
//		}
//		if(findDto.getMemberEmail() == null) {
//			return "redirect:email_is_null";
//		}
//		
//		emailService.sendPasswordResetMail(findDto);
//		return "redirect:find_pw_send_mail";
//	}
	
	// 회원 탈퇴
	@GetMapping("/exit")
	public String exit() {
		return "member/exit";
	}
	
	@PostMapping("/exit")
	public String exit(@RequestParam String memberPw, HttpSession session) {
		String memberEmail = (String) session.getAttribute("login");
		boolean success = memberDao.exit(memberEmail, memberPw);
		if(success) {			
			session.removeAttribute("login");
			return "redirect:/";
		} else {
			return "redirect:exit?error";
		}
	}
	
	@GetMapping("/exit_finish")
	public String exitFinish() {
		return "member/exit_finish";
	}
	
	
}
