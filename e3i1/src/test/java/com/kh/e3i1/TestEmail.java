package com.kh.e3i1;

import java.io.IOException;
import java.util.Scanner;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
public class TestEmail {

	@Autowired
	private JavaMailSender mailSender;
	
	@Test
	public void test() throws IOException, MessagingException {
		
		ClassPathResource template = new ClassPathResource("email/email-template.html");
		log.debug("file = " + template.getFile().getAbsolutePath());
		
		StringBuffer buffer = new StringBuffer();
		try (Scanner sc = new Scanner(template.getFile());) {
			while(sc.hasNextLine()) {
				buffer.append(sc.nextLine());
			}
		}
		
		String html = buffer.toString();
		
		Document doc = Jsoup.parse(html);
		Elements elements = doc.getElementsByClass("user-id");
		for(Element element : elements) {
			element.text("SISO 회원");
		}
		
		//마임 메세지
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, false, "UTF-8");
		
		helper.setTo("y0825131@naver.com");
		helper.setSubject("[SISO] 2022년 6월 소식지");
		helper.setText(doc.toString(), true);
		
		mailSender.send(message);
	}
	
}




