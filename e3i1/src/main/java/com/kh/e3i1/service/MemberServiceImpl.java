package com.kh.e3i1.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.entity.MemberProfileDto;
import com.kh.e3i1.repository.AttachmentDao;
import com.kh.e3i1.repository.ClubDao;
import com.kh.e3i1.repository.MemberDao;
import com.kh.e3i1.repository.MemberProfileDao;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberProfileDao memberProfileDao;
	
	@Autowired
	private ClubDao clubDao;
	
	@Autowired
	private ClubService clubService;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	// 회원가입
	@Transactional
	@Override
	public int MemberJoin(MemberDto memberDto) throws IllegalStateException, IOException {
		// 회원가입 
		int memberNo = memberDao.join(memberDto);
		
		// 첨부파일 및 회원 프로필 저장
		if((Integer)memberNo != null) {
			memberProfileDao.insert(memberNo, memberDto.getAttachNo());
		}
		
		return memberNo;
	}

	// MBTI정보 및 결과 프로필로 변경
	@Transactional
	@Override
	public int mypageMbtiProfile(MemberDto memberDto) {
		// MBTI 정보 변경
		int success = memberDao.mypageInterest(memberDto);
		
		// 프로필 사진 변경 
		if(success != 0) {
			return memberProfileDao.update(memberDto.getMemberNo(), memberDto.getAttachNo());
		}
			
		return 0;
	}

	// 회원 프로필 변경
	@Transactional
	@Override
	public int mypageMemberProfile(MemberDto memberDto, MultipartFile attach) throws IllegalStateException, IOException {
		int newAttachNo = attachmentDao.edit(attach, memberDto.getAttachNo());
		if(newAttachNo != 0) {
			memberProfileDao.insert(memberDto.getMemberNo(), newAttachNo);
		}
		
		return newAttachNo;
	}
	
	// 회원 탈퇴
	@Transactional
	@Override
	public boolean mypageMemberExit(MemberDto memberDto) {
		MemberProfileDto memberProfileDto = memberProfileDao.one(memberDto.getMemberNo());
		
		// 해당회원이 운영하는 소모임 정보
		List<ClubDto> list = clubDao.isClubLeader(memberDto.getMemberNo());
		if(list.isEmpty()) {
			return memberDao.exit(memberDto.getMemberEmail(), memberDto.getMemberPw());
		}
		// 운영중인 소모임 전부 양도
		int count = 0;
		for(ClubDto clubDto : list) {
			clubService.passLeader(clubDto);
			count += 1;
		}
		System.out.println("마지막관문"+count);
		return memberDao.exit(memberDto.getMemberEmail(), memberDto.getMemberPw()); 
	}
}
