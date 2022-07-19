package com.kh.e3i1.vo;

import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.entity.MessageDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //기본 생성자 생성
@AllArgsConstructor //모든 매개변수를 설정할 수 있는 생성자 생성
@Builder
public class MessageVO {
	private MemberDto memberDto;
	private MessageDto messageDto;
}
