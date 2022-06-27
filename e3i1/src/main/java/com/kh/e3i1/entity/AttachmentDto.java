package com.kh.e3i1.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@AllArgsConstructor 
@NoArgsConstructor 
@Builder
public class AttachmentDto {
	private int attachNo;
	private String attachUploadName;
	private String type;
	private long attachSize;
		
}
