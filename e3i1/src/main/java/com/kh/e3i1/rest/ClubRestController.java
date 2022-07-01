package com.kh.e3i1.rest;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.ClubMemberDto;
import com.kh.e3i1.repository.AttachmentDao;
import com.kh.e3i1.repository.ClubDao;
import com.kh.e3i1.repository.ClubMemberDao;
import com.kh.e3i1.service.ClubService;

@CrossOrigin(
			origins = {"http://127.0.0.1:5500"}
		)
@RestController
@RequestMapping("/rest/club")
public class ClubRestController {
	
	@Autowired
	private ClubDao clubDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private ClubService clubService;
	
	@Autowired
	private ClubMemberDao clubMemberDao;
	
	@GetMapping("/")
	public List<ClubDto> list(){
		return clubDao.list();
	}
	
	// 소모임 생성
	@PostMapping("/")
	public int createClub(
			@ModelAttribute ClubDto clubDto, 
			@RequestParam MultipartFile clubProfile
			) throws IllegalStateException, IOException {
		return clubService.createClub(clubDto, clubProfile);
	}
	
	@PostMapping("/member")
	public int insertClubMember(@ModelAttribute ClubMemberDto clubMemberDto) {
		return clubMemberDao.insert(clubMemberDto);
	}
}







