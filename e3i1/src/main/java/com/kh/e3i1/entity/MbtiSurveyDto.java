package com.kh.e3i1.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MbtiSurveyDto {
	
	private int surveyNo;
	private String surveyQuestion;
	private String surveyAnswer1;
	private String surveyAnswer2;

}
