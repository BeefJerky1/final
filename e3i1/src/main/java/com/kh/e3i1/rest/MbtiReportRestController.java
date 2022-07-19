
package com.kh.e3i1.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.e3i1.entity.ClubBoardReportDto;
import com.kh.e3i1.entity.MbtiBoardDto;
import com.kh.e3i1.entity.MbtiBoardReplyDto;
import com.kh.e3i1.entity.MbtiBoardReportDto;
import com.kh.e3i1.repository.MbtiBoardDao;
import com.kh.e3i1.repository.MbtiReportDao;
import com.kh.e3i1.vo.MbtiMemberListVO;

@RestController
@RequestMapping("/rest/mbtiReport")
public class MbtiReportRestController {

	@Autowired
	private MbtiBoardDao mbtiBoardDao;
	
	@Autowired
	private MbtiReportDao mbtiReportDao;
	
	// 신고 접수
	@PostMapping("/report")
	public int mbtiBoardReport(@RequestBody MbtiBoardReportDto mbtiBoardReportDto) {
		return mbtiReportDao.reportBoard(mbtiBoardReportDto);
	}
	
	
	// 신고내역 불러오기
	@GetMapping("/{mbtiBoardNo}")
	public List<MbtiBoardReportDto> list(@PathVariable int mbtiBoardNo) {
		return mbtiReportDao.list(mbtiBoardNo);
	}
}

