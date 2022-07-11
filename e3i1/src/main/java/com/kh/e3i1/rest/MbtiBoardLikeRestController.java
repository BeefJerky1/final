package com.kh.e3i1.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.e3i1.entity.MbtiBoardDto;
import com.kh.e3i1.entity.MbtiBoardLikeDto;
import com.kh.e3i1.entity.MbtiBoardVoteDto;
import com.kh.e3i1.repository.MbtiBoardLikeDao;

@RestController
@RequestMapping("/rest/mbtiBoardLike")
public class MbtiBoardLikeRestController {
	
	@Autowired
	MbtiBoardLikeDao mbtiBoardLikeDao;
	
	
	@PutMapping("/likeUpdate")
	public Map<String, Object> likeUpdate(@RequestBody MbtiBoardLikeDto mbtiBoardLikeDto) {
		
			Map<String, Object> param = new HashMap<String, Object>();
			
			// 좋아요 기능 
			
			Integer itLike = mbtiBoardLikeDao.ItLikeInfo(mbtiBoardLikeDto);
			//memberNo와 boardNo를 이용하여 itLike를 count하는 구문
			
			if(itLike == null) {//최초
				mbtiBoardLikeDao.likeInsert(mbtiBoardLikeDto);
			}
			else if(itLike == 0) {//취소된 상태이면 다시 +1 해주기
				mbtiBoardLikeDao.likeUpdate(mbtiBoardLikeDto);
			}
			else if(itLike == 1) {// 좋아요 된 상태이면 -1 해주기
				mbtiBoardLikeDao.likeDelete(mbtiBoardLikeDto);
			}
			param.put("itLike", itLike);
			
			return param;
	}
	
	@GetMapping("/{mbtiBoardNo}") 
	public int count(@RequestBody MbtiBoardLikeDto mbtiBoardLikeDto) {
		return mbtiBoardLikeDao.likeCount(mbtiBoardLikeDto);
	}

	
}
