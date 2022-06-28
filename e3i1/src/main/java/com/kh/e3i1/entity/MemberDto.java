package com.kh.e3i1.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MemberDto {
	private int memberNo;
	private String memberEmail;
	private String memberPw;
	private String memberNick;
	private String memberGender;
	private String memberMbti;
	private String memberAnimal;
	private String memberInterest1;
	private String memberInterest2;
	private String memberInterest3;
	private String memberPlace1;
	private String memberPlace2;
	private String memberPlace3;
	private int memberAdmin;
	private int memberReportCount;
	private int memberClubCount;
	private String memberSnsId;
	private Date memberLogindate;
	private Date memberBirth;
	private String memberName;
}

