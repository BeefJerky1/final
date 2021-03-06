package com.kh.e3i1.vo;


import java.util.Set;

import com.kh.e3i1.entity.AnimalPhotoDto;
import com.kh.e3i1.entity.BlockedDto;
import com.kh.e3i1.entity.ClubBoardReplyDto;
import com.kh.e3i1.entity.ClubReplyLikeDto;
import com.kh.e3i1.entity.ClubReplyReportDto;
import com.kh.e3i1.entity.MbtiAnimalDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.entity.MemberProfileDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@ AllArgsConstructor @NoArgsConstructor @Builder
public class ClubBoardReplyListVO {
	private ClubBoardReplyDto clubBoardReplyDto;
	private MemberDto memberDto;
	private MemberProfileDto memberProfileDto;
	private ClubReplyLikeDto clubReplyLikeDto;
	private ClubReplyReportDto clubReplyReportDto;
	private MbtiAnimalDto mbtiAnimalDto;
	private AnimalPhotoDto animalPhotoDto;
	private BlockedDto blockedDto;
}
