package com.kh.e3i1.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class AmountVO {
	private int total;
	private int tex_free;
	private int vat;
	private int point;
	private int discount;
}
