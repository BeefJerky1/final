package com.kh.e3i1.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ClubReplyLikeDto {
	private int clubReplyLikeNo;
	private int replyNo;
	private int likeMemberNo;
	private int likeCheck;
}
