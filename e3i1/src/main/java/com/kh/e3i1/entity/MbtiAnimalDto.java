package com.kh.e3i1.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MbtiAnimalDto {
	private int animalNo;
	private String animal;
	private String mbti;
}
