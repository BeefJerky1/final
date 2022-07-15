package com.kh.e3i1.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.ClubMemberDto;
import com.kh.e3i1.repository.AttachmentDao;
import com.kh.e3i1.repository.ClubDao;
import com.kh.e3i1.repository.ClubMemberDao;
import com.kh.e3i1.repository.ClubProfileDao;

@Service
public class ClubServiceImpl implements ClubService {
	
	@Autowired
	private ClubDao clubDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private ClubProfileDao clubProfileDao;
	
	@Autowired
	private ClubMemberDao clubMemberDao;
	

	@Transactional
	@Override
	public int createClub(ClubDto clubDto, MultipartFile clubProfile) throws IllegalStateException, IOException {
		// 소모임 생성
		int clubNo = clubDao.create(clubDto);
		// 소모임 생성시 소모임 회원에 같이 생성
		if(clubNo != 0) {
			clubMemberDao.insertClubLeader(clubNo, clubDto.getClubLeader());
			// attachment, clubProfile 테이블 insert
			if(!clubProfile.isEmpty()) {
				int attachNo = attachmentDao.save(clubProfile);
				clubProfileDao.insert(clubDto.getClubNo(), attachNo);
			}
		}
		return clubNo;
	}

	@Transactional
	@Override
	public int editClub(ClubDto clubDto, MultipartFile clubProfile, int attachNo) throws IllegalStateException, IOException {
		// 소모임 정보 변경
		int success = clubDao.editClub(clubDto);
		// 첨부파일, 소모임프로필 정보 삭제 및 저장
		if(success != 0) {
			if(!clubProfile.isEmpty() || attachNo != 0) {
				int newAttachNo = attachmentDao.edit(clubProfile, attachNo);
				clubProfileDao.insert(clubDto.getClubNo(), newAttachNo);
			}
		}
		return success;
	}

}
