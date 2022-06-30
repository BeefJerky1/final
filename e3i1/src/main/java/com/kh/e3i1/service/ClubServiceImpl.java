package com.kh.e3i1.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.repository.AttachmentDao;
import com.kh.e3i1.repository.ClubDao;
import com.kh.e3i1.repository.ClubProfileDao;

@Service
public class ClubServiceImpl implements ClubService {
	
	@Autowired
	private ClubDao clubDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private ClubProfileDao clubProfileDao;
	

	@Transactional
	@Override
	public int createClub(ClubDto clubDto, MultipartFile clubProfile) throws IllegalStateException, IOException {
		// 소모임 생성
		clubDao.create(clubDto);
		
		// attachment, clubProfile 테이블 insert
		if(!clubProfile.isEmpty()) {
			int attachNo = attachmentDao.save(clubProfile);
			clubProfileDao.insert(clubDto.getClubNo(), attachNo);
		}
		
		return clubDto.getClubNo();
	}

}
