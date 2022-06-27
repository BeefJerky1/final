package com.kh.e3i1.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@AllArgsConstructor 
@NoArgsConstructor 
@Builder
public class ClubBoardAttach {
	private int clubBoardNo;
	private int clubNo;
	private int attachNo;
}
