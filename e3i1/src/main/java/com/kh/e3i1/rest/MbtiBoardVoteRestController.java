package com.kh.e3i1.rest;

import java.util.HashMap;
import java.util.Map;

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
	public Map<String, Object> insert(
			@RequestBody MbtiBoardVoteDto mbtiBoardVoteDto) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		Integer voteChoice = mbtiBoardDao.itVoteinfo(mbtiBoardVoteDto);
		
		if(voteChoice == null) { // 투표한 적 없으면 insert
			mbtiBoardDao.vote(mbtiBoardVoteDto);
		}
		else if(voteChoice == 0 || voteChoice == 1) { // 투표한 적 있으면 삭제
			mbtiBoardDao.voteDelete(mbtiBoardVoteDto);
		}
		
		param.put("voteChoice", voteChoice);
		return param;
		
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
