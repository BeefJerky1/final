package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.NoticeDto;
import com.kh.e3i1.vo.NoticeDetailVO;
import com.kh.e3i1.vo.NoticeListVO;

public interface NoticeDao {
	List<NoticeListVO> list(String type, String keyword, int page, int size);
	int count(String type, String keyword);
	NoticeDto info(int noticeNo);
	NoticeDetailVO read(int noticeNo);
	
	int write(NoticeDto noticeDto);
	boolean delete(int noticeNo);
	boolean edit(NoticeDto noticeDto);
	
}
