package com.kh.e3i1.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BlockedDto {
	private int blockedNo;
	private int blockedUser;
	private int blockedTarget;
	
}
