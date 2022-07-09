package com.kh.e3i1.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.repository.AdminDao;

@CrossOrigin(
		origins = {"http://127.0.0.1:5500"}
	)
@RestController
@RequestMapping("/rest/admin")
public class AdminRestController {
	@Autowired
	private AdminDao adminDao;
	//멤버 리스트
	@GetMapping("/member/{orderType}")
	public List<MemberDto> memberList(@PathVariable(required=false) String orderType){
		return adminDao.memberList(orderType);
	}
	//멤버 삭제
	@DeleteMapping("/member/{memberNo}")
	public int deleteMember(@PathVariable int memberNo){
		return adminDao.deleteMember(memberNo);
	}
	//멤버 상세조회
	@GetMapping("/memberdetail/{memberNo}")
	public MemberDto oneMember(@PathVariable int memberNo){
		return adminDao.oneMember(memberNo);
	}
	//소모임 리스트
	@GetMapping("/club/{orderType}")
	public List<ClubDto> clubList(@PathVariable String orderType){
			return adminDao.clubList(orderType);

	}
	//소모임 삭제
	@DeleteMapping("/club/{clubNo}")
	public int deleteClub(@PathVariable int clubNo){
		return adminDao.deleteClub(clubNo);
	}
}
