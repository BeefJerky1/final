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
	private int memberNo;
	private Date clubMemberDate;
	private int clubMemberGrade;
	private String clubMemberAnswer1;
	private String clubMemberAnswer2;
	private String clubMemberAnswer3;
	private int clubMemberPermission;
	private String clubMemberRefuseMsg;
	
	// 회원 신고횟수 - 3회 누적시 해당 소모임에 더이상 가입신청 불가능
	private int clubRefuseCount;
}
