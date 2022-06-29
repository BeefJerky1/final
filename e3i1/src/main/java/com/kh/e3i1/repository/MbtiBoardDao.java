package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.MbtiBoardDto;
import com.kh.e3i1.vo.MbtiMemberListVO;

public interface MbtiBoardDao {

	List<MbtiMemberListVO> list(String type, String keyword);

	MbtiMemberListVO read(int mbtiBoardNo);

	int write(MbtiBoardDto mbtiBoardDto);

}
