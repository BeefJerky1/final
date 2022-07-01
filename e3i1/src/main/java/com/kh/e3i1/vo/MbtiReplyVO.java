package com.kh.e3i1.vo;

import com.kh.e3i1.entity.MbtiBoardDto;
import com.kh.e3i1.entity.MbtiBoardReplyDto;
import com.kh.e3i1.entity.MemberDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MbtiReplyVO {
	
	private MemberDto memberDto;
	private MbtiBoardDto mbtiBoardDto;
	private MbtiBoardReplyDto mbtiBoardReplyDto;

}
