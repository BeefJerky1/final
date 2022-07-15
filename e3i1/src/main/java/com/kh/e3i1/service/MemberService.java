package com.kh.e3i1.service;

import java.io.IOException;

import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.vo.MemberDetailVO;

public interface MemberService {
	
	int MemberJoin(MemberDto memberDto) throws IllegalStateException, IOException;

}
