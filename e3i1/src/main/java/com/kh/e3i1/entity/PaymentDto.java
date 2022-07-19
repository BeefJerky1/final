package com.kh.e3i1.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PaymentDto {
	private int paymentNo;
	private String paymentTid;
	private int paymentTotal;
	private String paymentName;
	private Date paymentTime;
	private String paymentStatus;
}
