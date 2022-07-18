package com.kh.e3i1.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class NoticeListVO {
	private String noticeHead, noticeTitle;
	private int noticeNo, attachNo;
}
