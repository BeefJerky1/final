package com.kh.e3i1.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.repository.AttachmentDao;
import com.kh.e3i1.repository.MemberDao;
import com.kh.e3i1.repository.MemberProfileDao;
import com.kh.e3i1.vo.AnimalPhotoVO;
import com.kh.e3i1.vo.MemberDetailVO;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberProfileDao memberProfileDao;
	
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
}
