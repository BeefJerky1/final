package com.kh.e3i1.rest;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.e3i1.entity.MbtiBoardDto;
import com.kh.e3i1.entity.MbtiBoardLikeDto;
import com.kh.e3i1.repository.MbtiBoardLikeDao;

@RestController
@RequestMapping("/rest/mbtiBoardLike")
public class MbtiBoardLikeRestController {
	
	@Autowired
	MbtiBoardLikeDao mbtiBoardLikeDao;
	
	@PutMapping("/likeUpdate")
	public MbtiBoardLikeDto likeUpdate(@RequestBody MbtiBoardLikeDto mbtiBoardLikeDto) {
	
		return mbtiBoardLikeDao.likeUpdate(mbtiBoardLikeDto);
	
	}

	
}
