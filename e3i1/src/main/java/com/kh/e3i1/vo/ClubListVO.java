package com.kh.e3i1.vo;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.ClubProfileDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ClubListVO {
	private ClubDto clubDto;
	private ClubMbtiPercentVO clubMbtiPercentVO;
	private ClubProfileDto clubProfileDto;
	private MbtiRankVO mbtiRankVO;
}
