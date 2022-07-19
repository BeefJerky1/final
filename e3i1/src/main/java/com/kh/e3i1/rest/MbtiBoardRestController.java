package com.kh.e3i1.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.e3i1.repository.MbtiBoardDao;
import com.kh.e3i1.vo.MbtiMemberListVO;

@RestController
@RequestMapping("/rest/mbtiBoard")
public class MbtiBoardRestController {
	
	@Autowired
	private MbtiBoardDao mbtiBoardDao;
	
	// 정렬을 위한 목록조회
	@GetMapping("/{coulmn}/{order}")
	public List<MbtiMemberListVO> list
			(@RequestParam(required = false) String keyword,
					@PathVariable String column, String order) {
		return mbtiBoardDao.listAll(keyword, column, order);
	}

}
