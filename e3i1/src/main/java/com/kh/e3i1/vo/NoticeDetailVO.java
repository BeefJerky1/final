package com.kh.e3i1.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@AllArgsConstructor@NoArgsConstructor@Builder
public class NoticeDetailVO {

	
	private int noticeNo, attachNo;
	private int memberNo;
	private String noticeTitle, memberNick;
	private String noticeContent;
	private String noticeHead;

}
