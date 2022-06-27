package com.kh.e3i1.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ClubMemberDto {
	private int clubMemberNo;
	private int clubNo;
	private Date clubMemberDate;
	private String clubMemberGrade;
	private String clubMemberAnswer1;
	private String clubMemberAnswer2;
	private String clubMemberAnswer3;
	private int clubMemberPermission;
	private String clubMemberRefuseMsg;
}
