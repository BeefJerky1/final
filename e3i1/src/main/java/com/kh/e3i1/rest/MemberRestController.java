package com.kh.e3i1.rest;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.repository.AttachmentDao;
import com.kh.e3i1.repository.MemberDao;
import com.kh.e3i1.repository.MemberProfileDao;
import com.kh.e3i1.service.MemberService;
import com.kh.e3i1.vo.MemberDetailVO;

@CrossOrigin(
		origins = {"http://127.0.0.1:5500"}
	)
@RestController
@RequestMapping("/rest/mypage")
public class MemberRestController {
	
	@Autowired
	private MemberProfileDao memberProfileDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberDao memberDao;
	
	
	@GetMapping("/member/{memberNo}")
	public MemberDetailVO mypageMember(@PathVariable int memberNo) {
		return memberDao.mypageMember(memberNo);
	}
	
	@GetMapping("/club/{memberNo}")
	public List<MemberDetailVO> mypageClub(@PathVariable int memberNo){
		return memberDao.mypageClub(memberNo);
	}
	
	@GetMapping("/mbti/{memberNo}")
	public List<MemberDetailVO> mypageMbti(@PathVariable int memberNo){
		return memberDao.mypageMbti(memberNo);
	}
	
	@PutMapping("/member_interest")
	public int mypageInterest(@RequestBody MemberDto memberDto) {
		return memberDao.mypageInterest(memberDto);
	}
	
	@PutMapping("/member_mbti")
	public int mypageMbti(@RequestBody MemberDto memberDto) {
		return memberDao.mypageInterest(memberDto);
	}
	
	@PutMapping("/member_mbti_profile")
	public int mypageMbtiProfile(@RequestBody MemberDto memberDto) {
		return memberService.mypageMbtiProfile(memberDto);
	}
	
	@PostMapping("/member_profile")
	public int mypageMemberProfile(
			@ModelAttribute MemberDto memberDto,
			@RequestParam MultipartFile attach
			) throws IllegalStateException, IOException {
		System.out.println(memberDto.getAttachNo());
		return memberService.mypageMemberProfile(memberDto, attach);
	}
	
}
