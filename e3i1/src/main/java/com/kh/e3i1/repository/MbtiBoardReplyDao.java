package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.MbtiBoardReplyDto;
import com.kh.e3i1.vo.MbtiReplyVO;

public interface MbtiBoardReplyDao {

	MbtiBoardReplyDto insert(MbtiBoardReplyDto mbtiBoardReplyDto);

	List<MbtiReplyVO> list(int mbtiBoardNo);

	void delete(int replyNo);

	void calculateReplyCount(int mbtiBoardNo);
	
	MbtiBoardReplyDto edit(MbtiBoardReplyDto mbtiBoardReplyDto);

}
