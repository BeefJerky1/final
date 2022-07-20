package com.kh.e3i1.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ClubPlusDto {
	private int clubPlusNo;
	private String clubPlusName;
	private int clubPlusPrice;
}
