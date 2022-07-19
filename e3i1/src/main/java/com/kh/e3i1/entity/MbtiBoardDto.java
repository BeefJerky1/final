package com.kh.e3i1.entity;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MbtiBoardDto {
	
	private int mbtiBoardNo;
	private int memberNo;
	private String mbtiBoardTitle; 
	private String mbtiBoardContent;
	private Date mbtiBoardTime;
	private int mbtiBoardVote1;
	private int mbtiBoardVote2;
	private int mbtiBoardReplyCount;
	
	private int mbtiBoardWriter;
	private int mbtiReportCount;
	
	// 마이페이지용  좋아요수
	private int likeCount;

}
