package com.kh.e3i1.vo;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.ClubPaymentDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.entity.PaymentDetailDto;
import com.kh.e3i1.entity.PaymentDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor @AllArgsConstructor @Data @Builder
public class PaymentDetailVO {
	private MemberDto memberDto;
	private ClubDto clubDto;
	private PaymentDetailDto paymentDetailDto;
	private ClubPaymentDto clubPaymentDto;
	private PaymentDto paymentDto;
}
