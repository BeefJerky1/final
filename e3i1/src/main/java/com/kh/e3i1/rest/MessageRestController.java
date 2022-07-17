package com.kh.e3i1.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.entity.MessageDto;
import com.kh.e3i1.repository.MemberDao;
import com.kh.e3i1.repository.MessageDao;
import com.kh.e3i1.vo.MessageVO;

@RestController
@RequestMapping("/rest/message")
public class MessageRestController {
	@Autowired
	private MessageDao messageDao;
	@Autowired
	private MemberDao memberdao;
	
	//회원정보 조회
	@GetMapping("/member/{memberNo}")
	public MemberDto memberData(@PathVariable int memberNo){		
		return memberdao.info(memberNo);
	}
	
	//받은 메세지
	@GetMapping("/received/{messageReceiver}")
	public List<MessageVO> messageRecieved(@PathVariable int messageReceiver){		
		return messageDao.messageReceived(messageReceiver);
	}
	//보낸 메세지
	@GetMapping("/sent/{messageWriter}")
	public List<MessageVO> messageSent(@PathVariable int messageWriter){		
		return messageDao.messageSent(messageWriter);
	}
	//메세지 작성
	@PostMapping("/send")
	public int sendMessage(@RequestBody MessageDto messageDto) {
		return messageDao.sendMessage(messageDto);
	}
	//메세지 작성
	@PostMapping("/sendAll")
	public int sendAllMessage(@RequestBody MessageDto messageDto) {
		return messageDao.sendMessage(messageDto);
	}
	//메세지 상세
	@GetMapping("/detail/{messageNo}")
	public MessageVO messageDetail(@PathVariable int messageNo) {
		return messageDao.messageDetail(messageNo);
	}
	//메세지 상세
		@GetMapping("/detailsent/{messageNo}")
		public MessageVO messageSentDetail(@PathVariable int messageNo) {
			return messageDao.messageSentDetail(messageNo);
	}
	//메세지 삭제
	@DeleteMapping("/delete/{messageNo}")
	public int deleteMessage(@PathVariable int messageNo) {
		return messageDao.deleteMessage(messageNo);
	}
}
