package com.kh.e3i1.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.e3i1.entity.MbtiBoardReplyDto;
import com.kh.e3i1.repository.MbtiBoardReplyDao;
import com.kh.e3i1.vo.MbtiReplyVO;

@RestController
@RequestMapping("/rest/mbtiBoardReply")
public class MbtiBoardReplyRestController {
	
	@Autowired
	private MbtiBoardReplyDao mbtiBoardReplyDao;
	
	@PostMapping("/")
	public MbtiBoardReplyDto insert(
				@RequestBody  MbtiBoardReplyDto mbtiBoardReplyDto
			) {
		
		// 임시 작성자 추가
		int memberNo = 7;
		mbtiBoardReplyDto.setMemberNo(memberNo);
		
		return mbtiBoardReplyDao.insert(mbtiBoardReplyDto);
		
	}
	
	@GetMapping("/{mbtiBoardNo}")
	public List<MbtiReplyVO> list(@PathVariable int mbtiBoardNo) {
		
		return mbtiBoardReplyDao.list(mbtiBoardNo);
	}
	
	@DeleteMapping("/{replyNo}")
	public void delete(@PathVariable int replyNo) {
		mbtiBoardReplyDao.delete(replyNo);
	}
	
	@PutMapping("/")
	public MbtiBoardReplyDto edit(@RequestBody MbtiBoardReplyDto mbtiBoardReplyDto) {
		return mbtiBoardReplyDao.edit(mbtiBoardReplyDto);
	}
	
	

}
