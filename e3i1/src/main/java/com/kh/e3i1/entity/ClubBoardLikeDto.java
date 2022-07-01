package com.kh.e3i1.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ClubBoardLikeDto {
	private int clubBoardLikeNo;
	private int clubBoardNo;
	private int memberNo;
	private int likeCheck;
}
