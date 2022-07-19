package com.kh.e3i1.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PaymentDetailDto {
	private int paymentDetailNo;
	private int paymentNo;
	private String paymentDetailName;
	private int paymentDetailQuantity;
	private int paymentDetailPrice;
	private String paymentDetailStatus;
	
	public int getPaymentTotal() {
		return this.paymentDetailPrice * this.paymentDetailQuantity;
	}
}
