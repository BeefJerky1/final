package com.kh.e3i1.vo;

import java.util.List;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor //기본 생성자 생성
@AllArgsConstructor //모든 매개변수를 설정할 수 있는 생성자 생성
@Builder
public class AdminSearchVO {
	private String column;
	private String order;
	private int memberNo;
	private String memberName;
	private String memberNick;
	private String memberEmail;
	private String memberPhone;
	private int clubNo;
	private int clubLeader;
	private String clubName;
	private String clubMainCategory;
	private String clubSubCategory;
	private String clubPlace;
	private int mbtiBoardNo;
	private String mbtiBoardTitle;
	private String mbtiBoardContent;
	private int mbtiBoardReplyCount;
}
