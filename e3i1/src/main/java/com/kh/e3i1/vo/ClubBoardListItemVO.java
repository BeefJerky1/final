package com.kh.e3i1.vo;

import java.util.List;

import com.kh.e3i1.entity.ClubBoardAttachDto;
import com.kh.e3i1.entity.ClubBoardDto;
import com.kh.e3i1.entity.ClubBoardLikeDto;
import com.kh.e3i1.entity.ClubBoardReportDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.entity.MemberProfileDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@ AllArgsConstructor @NoArgsConstructor @Builder
public class ClubBoardListItemVO {
	private ClubBoardDto clubBoardDto;
	private List<ClubBoardAttachDto> attach;
	private MemberDto memberDto;
	private MemberProfileDto memberProfileDto;
	private ClubBoardLikeDto clubBoardLikeDto;
	private ClubBoardReportDto clubBoardReportDto;

}
