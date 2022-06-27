package com.kh.e3i1.entity;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MbtiBoardReplyDto {
	
	private int replyNo;
	private int mbtiBoardNo;
	private int memberNo;
	private String mbtiReplyContent;
	private Date mbtiReplyTime;
	private int superNo;

}
