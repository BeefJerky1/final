package com.kh.e3i1.service;

import javax.mail.MessagingException;

import com.kh.e3i1.entity.MemberDto;

public interface EmailService {
	void sendCertification(String email);
	void sendPasswordResetMail(MemberDto findDto) throws MessagingException;
}
