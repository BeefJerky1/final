package com.kh.e3i1.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.e3i1.entity.MbtiBoardVoteDto;
import com.kh.e3i1.repository.MbtiBoardDao;

@RestController
@RequestMapping("/rest/mbtiBoardVote")
public class MbtiBoardVoteRestController {

	@Autowired
	private MbtiBoardDao mbtiBoardDao;
	
	@PostMapping("/")
	public MbtiBoardVoteDto insert(
			@RequestBody MbtiBoardVoteDto mbtiBoardVoteDto) {
		
		int memberNo =5;
		mbtiBoardVoteDto.setMemberNo(memberNo);
		
		return mbtiBoardDao.vote(mbtiBoardVoteDto);
	}
	
	@GetMapping("/{mbtiBoardNo}")
	public int count(@PathVariable int mbtiBoardNo) {
		return mbtiBoardDao.voteCount(mbtiBoardNo);
	}
	
	@GetMapping("/total/{mbtiBoardNo}")
	public int countTotal(@PathVariable int mbtiBoardNo) {
		return mbtiBoardDao.voteCountTotal(mbtiBoardNo);
	}
}
