package com.kh.e3i1.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MbtiBoardLikeDto {
	
	private int memberNo;
	private int mbtiBoardNo;
	private int itLike;
	private int count;
	

}
