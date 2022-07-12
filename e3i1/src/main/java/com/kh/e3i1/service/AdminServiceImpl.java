package com.kh.e3i1.service;

import java.io.IOException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.MbtiAnimalDto;
import com.kh.e3i1.repository.AdminDao;
import com.kh.e3i1.repository.AttachmentDao;
@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AttachmentDao attachmentDao;
	@Autowired
	private AdminDao adminDao;
	
	@Transactional
	@Override
	public int insertPhoto(MbtiAnimalDto mbtiAnimalDto, MultipartFile files) throws IllegalStateException, IOException {
		int attachNo= attachmentDao.save(files);
		int animalNo= adminDao.insertMbtiAnimal(mbtiAnimalDto);
		
		 adminDao.insertPhoto(attachNo, animalNo);
		return attachNo;
	}
}
