package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.MessageDto;
import com.kh.e3i1.vo.MessageVO;

public interface MessageDao {

	//메세지 보내기
	int sendMessage(MessageDto messageDto);

	//받은 편지함
	List<MessageVO> messageReceived(int messageReceiver);

	//보낸 편지함
	List<MessageVO> messageSent(int messageWriter);

	MessageVO messageDetail(int messageNo);

	int deleteMessage(int messageNo);

	MessageVO messageSentDetail(int messageNo);

}
