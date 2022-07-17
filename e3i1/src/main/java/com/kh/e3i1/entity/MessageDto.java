package com.kh.e3i1.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MessageDto {

	private int messageNo;
	private int messageWriter;
	private int messageReceiver;
	private String messageTitle;
	private String messageContent;
	private int messageReadcount;
	private Date messageSendTime;
	private Date messageReceiveTime;
}
