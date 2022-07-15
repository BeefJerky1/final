package com.kh.e3i1.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Transactional
	@Override
	public int MemberJoin(MemberDto memberDto) throws IllegalStateException, IOException {
		// 회원가입 
		int memberNo = memberDao.join(memberDto);
		System.out.println(memberNo);
		
		// 첨부파일 및 회원 프로필 저장
		if((Integer)memberNo != null) {
			memberProfileDao.insert(memberNo, memberDto.getAttachNo());
		}
		
		return memberNo;
	}
}
