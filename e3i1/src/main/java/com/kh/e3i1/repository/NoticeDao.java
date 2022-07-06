package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.NoticeDto;

public interface NoticeDao {
	List<NoticeDto> list(String type, String keyword, int page, int size);
	int count(String type, String keyword);
	NoticeDto info(int noticeNo);
	NoticeDto read(int noticeNo);
	
	int write(NoticeDto noticeDto);
	boolean delete(int noticeNo);
	boolean edit(NoticeDto noticeDto);
	
}
