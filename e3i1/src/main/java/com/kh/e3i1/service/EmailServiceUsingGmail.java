package com.kh.e3i1.service;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.e3i1.entity.CertDto;
import com.kh.e3i1.repository.CertDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmailServiceUsingGmail implements EmailService {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private CertDao certDao;
	
	private Random r = new Random();
	private Format f = new DecimalFormat("000000");

	@Override
	public void sendCertification(String email) {
		int certNumber = r.nextInt(1000000);
		String certString = f.format(certNumber);
		log.debug("이메일 = {}", email);
		log.debug("인증번호 = {}", certString);
		
		String title = "[SISO] 인증번호를 보내드립니다";
		String content = "인증번호 : "+certString;
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email);
		message.setSubject(title);
		message.setText(content);
		
		mailSender.send(message);
		
		certDao.insert(CertDto.builder()
												.certTarget(email)
												.certNumber(certString)
												.build());
	}
	
}