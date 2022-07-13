package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.MbtiBoardDto;
import com.kh.e3i1.entity.MbtiBoardVoteDto;
import com.kh.e3i1.vo.MbtiMemberListVO;

public interface MbtiBoardDao {


	MbtiMemberListVO read(int mbtiBoardNo);

	int write(MbtiBoardDto mbtiBoardDto);

	boolean delete(int mbtiBoardNo);



	MbtiBoardDto info(int mbtiBoardNo);

	boolean edit(MbtiBoardDto mbtiBoardDto);


	int count(String type);

	List<MbtiMemberListVO> list(String type, int page, int size);

	List<MbtiMemberListVO> list(String type, String keyword);

	MbtiBoardVoteDto vote(MbtiBoardVoteDto mbtiBoardVoteDto);

	int voteCount(int mbtiBoardNo);

	int voteCountTotal(int mbtiBoardNo);

	Integer itVoteinfo(MbtiBoardVoteDto mbtiBoardVoteDto);

	void voteDelete(MbtiBoardVoteDto mbtiBoardVoteDto);

}
