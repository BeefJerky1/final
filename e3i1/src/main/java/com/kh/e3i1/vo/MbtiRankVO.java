package com.kh.e3i1.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class MbtiRankVO {
	private int clubNo;
	private String memberMbti;
	private int animalNo;
	private String animal;
	private int attachNo;
	private int mbtiCount;
	private int mbtiPercent;
	
	private String greatestMbti;
	private int greatestAnimalNo;
	private String greatestAnimal;
	private String leastMbti;
	private int leastAnimalNo;
	private String leastAnimal;
	
	private int likeCount;
}
