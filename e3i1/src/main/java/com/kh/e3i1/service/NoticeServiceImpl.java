package com.kh.e3i1.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.TinyBitSet;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.NoticeDto;
import com.kh.e3i1.repository.AttachmentDao;
import com.kh.e3i1.repository.NoticeAttachDao;
import com.kh.e3i1.repository.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private NoticeAttachDao noticeAttachDao;
	
	@Transactional
	@Override
	public void write(NoticeDto noticeDto, MultipartFile noticeAttach) throws IllegalStateException, IOException {
		noticeDao.write(noticeDto);
		int attachNo = 1;
		if(!noticeAttach.isEmpty()) {
			attachNo = attachmentDao.save(noticeAttach);
		}
		
		noticeAttachDao.insert(noticeDto.getNoticeNo(), attachNo);
	}
	
	@Transactional
	@Override
	public boolean edit(NoticeDto noticeDto, MultipartFile noticeAttach, int attachNo) throws IllegalStateException, IOException {
		boolean success = noticeDao.edit(noticeDto);
		if(success) {
			int newAttachNo = attachmentDao.save(noticeAttach);
			attachmentDao.delete(attachNo);
			noticeAttachDao.insert(noticeDto.getNoticeNo(), newAttachNo);
		}
		
		return success;
	}
}
