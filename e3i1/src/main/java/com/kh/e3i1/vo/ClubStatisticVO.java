package com.kh.e3i1.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //기본 생성자 생성
@AllArgsConstructor //모든 매개변수를 설정할 수 있는 생성자 생성
@Builder
public class ClubStatisticVO {
	
	private int like;
	private int report;
	private int reply;
	private int read;
	private int total;
	private int daily;
	private int monthly;
	private int yearly;
	
}
