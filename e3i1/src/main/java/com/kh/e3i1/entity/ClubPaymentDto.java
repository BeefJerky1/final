package com.kh.e3i1.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class ClubPaymentDto {
	private int clubPlusNo;
	private int clubNo;
	private int paymentNo;
}
