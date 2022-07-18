package com.kh.e3i1.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.MessageDto;
import com.kh.e3i1.vo.MessageVO;

@Repository
public class MessageDaoImpl implements MessageDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sendMessage1(MessageDto messageDto) {
		//시퀀스 생성
		int messageNo= sqlSession.selectOne("message.sequence");
		messageDto.setMessageNo(messageNo);
		//메세지 생성
		sqlSession.insert("message.sendmessage", messageDto);
		MessageDto resultDto = sqlSession.selectOne("message.info", messageNo);
		if(resultDto==null) {
			return 0;
		}else {
			return 1;
		}
	}

	@Override
	public List<MessageVO> messageReceived(int messageReceiver) {
		return sqlSession.selectList("message.messagereceived", messageReceiver);
	}

	@Override
	public List<MessageVO> messageSent(int messageWriter) {
		return sqlSession.selectList("message.messagesent", messageWriter);
	}
	
	//받은 메세지 상세조회
	@Override
	public MessageVO messageDetail(int messageNo) {
		sqlSession.update("message.readcount",messageNo); //조회수 증가
		sqlSession.update("message.readtime",messageNo); //조회 시간
		return sqlSession.selectOne("message.messagedetail",messageNo); //메세지 조회
		
	}

	@Override
	public int deleteMessage(int messageNo) {
		sqlSession.delete("message.deletemessage",messageNo);
		MessageDto messageDto = sqlSession.selectOne("message.info",messageNo);
		if(messageDto==null) {
			return 1;
		}else {
			return 0;
		}
	}
	//보낸 메세지 상세조회
	@Override
	public MessageVO messageSentDetail(int messageNo) {
		return sqlSession.selectOne("message.messagesentdetail",messageNo); //메세지 조회
	}

	@Override
	public List<Integer> sendMessage2(MessageDto messageDto, List<Integer> asdf) {
		List<Integer> sentTo = new ArrayList<Integer>();
		for(Integer no :asdf) {
			int messageNo= sqlSession.selectOne("message.sequence");
			messageDto.setMessageNo(messageNo);
			messageDto.setMessageReceiver(no);
			sqlSession.insert("message.sendmessage", messageDto);
		}
		return sentTo;
	}

	@Override
	public List<Integer> sendMessage3(MessageDto messageDto, List<Integer> asdf) {
		List<Integer> sentTo = new ArrayList<Integer>();
		for(Integer messageReceiver: asdf) {
			int messageNo= sqlSession.selectOne("message.sequence");
			messageDto.setMessageNo(messageNo);
			messageDto.setMessageReceiver(messageReceiver);
			sqlSession.insert("message.sendmessage", messageDto);
			sentTo.add(messageReceiver);
		}
		return sentTo;
	}

}
