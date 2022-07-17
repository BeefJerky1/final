package com.kh.e3i1.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.vo.MemberDetailVO;

public interface MemberService {
	
	int MemberJoin(MemberDto memberDto) throws IllegalStateException, IOException;

	int mypageMbtiProfile(MemberDto memberDto);

	int mypageMemberProfile(MemberDto memberDto, MultipartFile attach) throws IllegalStateException, IOException;

}
