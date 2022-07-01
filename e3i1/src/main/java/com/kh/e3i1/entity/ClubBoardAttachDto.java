package com.kh.e3i1.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@AllArgsConstructor 
@NoArgsConstructor 
@Builder
public class ClubBoardAttachDto {
	private int clubBoardNo;
	private int clubNo;
	private int attachNo;
}
