package com.kh.e3i1.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ClubComplexSearchVO {
	private String mainList;
	private String subList;
	private String city2;
	private List<String> mbtiList;
	private int page;
}
