package com.kh.e3i1.vo;

import lombok.Builder;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PurchaseVO {
	private int clubNo;
	private int clubPlusNo;
	private int quantity = 1;
}
