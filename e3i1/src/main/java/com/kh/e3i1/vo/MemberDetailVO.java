package com.kh.e3i1.vo;

import com.kh.e3i1.entity.AnimalPhotoDto;
import com.kh.e3i1.entity.ClubBoardDto;
import com.kh.e3i1.entity.ClubBoardLikeDto;
import com.kh.e3i1.entity.ClubBoardReplyDto;
import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.ClubLikeDto;
import com.kh.e3i1.entity.ClubMemberDto;
import com.kh.e3i1.entity.ClubReplyLikeDto;
import com.kh.e3i1.entity.MbtiAnimalDto;
import com.kh.e3i1.entity.MbtiBoardDto;
import com.kh.e3i1.entity.MbtiBoardLikeDto;
import com.kh.e3i1.entity.MbtiBoardReplyDto;
import com.kh.e3i1.entity.MbtiBoardVoteDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.entity.MemberProfileDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MemberDetailVO {
	private MemberDto memberDto;
	private ClubDto clubDto;
	private ClubMemberDto clubMemberDto;
	private ClubLikeDto clubLikeDto;
	private MemberProfileDto memberProfileDto;
	private MbtiAnimalDto mbtiAnimalDto;
	private AnimalPhotoDto animalPhotoDto;
	private ClubBoardDto clubBoardDto;
	private ClubBoardReplyDto clubBoardReplyDto;
	private ClubBoardLikeDto clubBoardLikeDto;
	private ClubReplyLikeDto clubReplyLikeDto;
	private MbtiBoardDto mbtiBoardDto;
	private MbtiBoardReplyDto mbtiBoardReplyDto;
	private MbtiBoardLikeDto mbtiBoardLikeDto;
	private MbtiBoardVoteDto mbtiBoardVoteDto;
}
