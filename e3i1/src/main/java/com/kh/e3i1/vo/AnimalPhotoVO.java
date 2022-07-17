package com.kh.e3i1.vo;

import com.kh.e3i1.entity.AnimalPhotoDto;
import com.kh.e3i1.entity.AttachmentDto;
import com.kh.e3i1.entity.MbtiAnimalDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class AnimalPhotoVO {
	private AnimalPhotoDto animalPhotoDto;
	private MbtiAnimalDto mbtiAnimalDto;
	private AttachmentDto attachmentDto;
}
