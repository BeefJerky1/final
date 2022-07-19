package com.kh.e3i1.vo;

import com.kh.e3i1.entity.AnimalPhotoDto;
import com.kh.e3i1.entity.AttachmentDto;
import com.kh.e3i1.entity.BlockedDto;
import com.kh.e3i1.entity.MbtiAnimalDto;
import com.kh.e3i1.entity.MemberDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BlockedVO {
	private MemberDto memberDto;
	private BlockedDto blockedDto;
}
