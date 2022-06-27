package com.kh.e3i1.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class NoticeDto {
	
	private int noticeNo;
	private int memberNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeHead;

}
