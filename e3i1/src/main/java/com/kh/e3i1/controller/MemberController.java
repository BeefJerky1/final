package com.kh.e3i1.controller;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
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

import com.kh.e3i1.entity.CertDto;
import com.kh.e3i1.entity.MbtiSurveyDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.error.UnauthorizeException;
import com.kh.e3i1.repository.CertDao;
import com.kh.e3i1.repository.MbtiSurveyDao;
import com.kh.e3i1.repository.MemberDao;
import com.kh.e3i1.service.EmailService;
import com.kh.e3i1.service.MemberService;
import com.kh.e3i1.vo.AnimalPhotoVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	// 의존성 주입
	@Autowired
	private MemberDao memberDao;
	
//	@Autowired
//	private AttachmentDao attachmentDao;
//	
//	@Autowired
//	private MemberProfileDao memberProfileDao;
//	
//	@Autowired
//	private MemberService memberService;
	
	@Autowired
	private MbtiSurveyDao mbtiSurveyDao;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private CertDao certDao;
	
	@Autowired
	private MemberService memberService;
	
	// 회원가입
	@GetMapping("/join")
	public String join(Model model) {
		
		List<MbtiSurveyDto> list = mbtiSurveyDao.select();
		model.addAttribute("list", list);
		return "member/join";
	}
	
	@PostMapping("/join")
	public String join(
			@ModelAttribute MemberDto memberDto
			) throws Exception {
		memberService.MemberJoin(memberDto);
		
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
			HttpServletResponse response
			) {
		
		MemberDto memberDto = memberDao.login(memberEmail, memberPw);
		
		if(memberDto != null) {
			session.setAttribute("login", memberDto.getMemberNo());
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
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		session.removeAttribute("auth");
		return "redirect:/";
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
	
	@PostMapping("/find_pw")
	public String findPw(@ModelAttribute MemberDto memberDto) throws MessagingException {
		MemberDto findDto = memberDao.find(memberDto);
		if(findDto == null) {
			return "redirect:find_pw?error";
		}
		if(findDto.getMemberEmail() == null) {
			return "redirect:email_is_null";
		}
		emailService.sendPasswordResetMail(findDto);
		return "redirect:find_pw_send_mail";
	}
	
	@GetMapping("/email_is_null")
	public String emailIsNull() {
		return "error/email_is_null";
	}
	
	private Random r = new Random();
	private Format f = new DecimalFormat("000000");
	
	@GetMapping("/reset")
	public String reset(
			@RequestParam String memberEmail, 
			@RequestParam String cert,
			Model model) {
		CertDto certDto = CertDto.builder().certTarget(memberEmail).certNumber(cert).build();
		boolean isOk = certDao.check(certDto);
		if(isOk) {
			String newCert = f.format(r.nextInt(1000000));
			certDao.insert(CertDto.builder()
														.certTarget(memberEmail)
														.certNumber(newCert)
													.build());
			model.addAttribute("cert", newCert);
			
			return "member/reset";
		}
		else {
			throw new UnauthorizeException();//401
		}
	}
	
	@PostMapping("/reset")
	public String reset(
			@ModelAttribute MemberDto memberDto,
			@RequestParam String cert) {
		boolean isOk = certDao.check(CertDto.builder()
										.certTarget(memberDto.getMemberEmail())
										.certNumber(cert)
										.build());
		if(isOk) {
			boolean result = memberDao.changePassword(memberDto);
			if(result) {
				return "redirect:reset_success";
			}
		}
		throw new UnauthorizeException();//401
	}
	
	@GetMapping("/find_pw_send_mail")
	public String findPwSendMail() {
		return "member/find_pw_send_mail";
	}
	
	@GetMapping("/reset_success")
	public String resetSuccess() {
		return "member/reset_success";
	}
	
	// 회원 탈퇴
	@GetMapping("/exit")
	public String exit() {
		return "member/exit";
	}
	
	@PostMapping("/exit")
	public String exit(@RequestParam String memberPw, HttpSession session) {
		int memberNo = (Integer) session.getAttribute("login");
		MemberDto memberDto = memberDao.info(memberNo);
		
		System.out.println("확인");
		
		boolean success = memberService.mypageMemberExit(memberDto);
		if(success) {			
			session.removeAttribute("login");
			session.removeAttribute("auth");
			System.out.println("성공");
			return "redirect:exit_finish";
		} else {
			System.out.println("실패");
			return "redirect:exit?error";
		}
	}
	
	@GetMapping("/exit_finish")
	public String exitFinish() {
		return "member/exit_finish";
	}
	
	// 회원정보보기
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		int memberNo = (Integer) session.getAttribute("login");
		MemberDto memberDto = memberDao.info(memberNo);
		
		model.addAttribute("memberDto", memberDto);
		
		List<MbtiSurveyDto> list = mbtiSurveyDao.select();
		model.addAttribute("list", list);
		
		return "member/mypage";
	}
	
	// 비밀번호 변경
	@GetMapping("/password")
	public String password() {
		return "member/password";
	}
	
	@PostMapping("/password")
	public String password(
				@RequestParam String currentPw,
				@RequestParam String changePw,
				HttpSession session
			) {
		int memberNo = (Integer) session.getAttribute("login");
		MemberDto memberDto = memberDao.info(memberNo);
		boolean success = memberDao.changePassword(memberDto.getMemberEmail(), currentPw, changePw);
		if(success) {
			return "redirect:mypage?success=2";
		}
		else {
			return "redirect:mypage?error=2";
		}
	}
	
	// 개인정보 수정
	@GetMapping("/information")
	public String information(HttpSession session, Model model) {
		int memberNo = (Integer) session.getAttribute("login");
		MemberDto memberDto = memberDao.info(memberNo);
		model.addAttribute("memberDto", memberDto);
		return "member/information";
	}
	
	@PostMapping("/information")
	public String information(HttpSession session, @ModelAttribute MemberDto memberDto) {
		int memberNo = (Integer) session.getAttribute("login");
		MemberDto existMember = memberDao.info(memberNo);
		memberDto.setMemberNo(memberNo);
		memberDto.setMemberEmail(existMember.getMemberEmail());
		memberDto.setMemberPw(existMember.getMemberPw());
		
		boolean success = memberDao.changeInformation(memberDto);
		if(success) {
			return "redirect:mypage?success=1";
		}
		else {
			return "redirect:mypage?error=1";
		}
	}
	@GetMapping("/message")
	public String message() {
		return "member/message";
	}
}
