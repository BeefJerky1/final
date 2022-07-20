package com.kh.e3i1.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.entity.NoticeDto;

public interface NoticeService {
	void write(NoticeDto noticeDto, MultipartFile noticeAttach) throws IllegalStateException, IOException;
	boolean edit(NoticeDto noticeDto, MultipartFile noticeAttach, int attachNo) throws IllegalStateException, IOException;
}
