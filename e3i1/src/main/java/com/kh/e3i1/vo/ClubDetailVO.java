package com.kh.e3i1.vo;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.ClubLikeDto;
import com.kh.e3i1.entity.ClubProfileDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.entity.MemberProfileDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ClubDetailVO {
	private ClubMbtiPercentVO clubMbtiPercent;
	private ClubDto clubDto;
	private ClubProfileDto clubProfileDto;
	private ClubLikeDto clubLikeDto;
	private MemberDto memberDto;
	private MemberProfileDto memberProfileDto;
}
