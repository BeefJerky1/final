package com.kh.e3i1.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.e3i1.entity.MbtiBoardDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.repository.MbtiBoardDao;
import com.kh.e3i1.repository.MemberDao;
import com.kh.e3i1.vo.MbtiMemberListVO;

@Controller
@RequestMapping("/mbtiBoard")
public class MbtiBoardController {

	@Autowired
	private MbtiBoardDao mbtiBoardDao;

	@Autowired
	private MemberDao memberDao;

	// 목록 조회
	@GetMapping("/list")
	public String list(@RequestParam(required = false) String type, @RequestParam(required = false) String keyword,
			Model model) {

		List<MbtiMemberListVO> list = mbtiBoardDao.list(type, keyword);
		model.addAttribute("list", list);

		boolean search = type != null && keyword != null;
		model.addAttribute("search", search);

		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);

		return "mbtiBoard/list";

	}

	// 상세 보기
	@GetMapping("/detail")
	public String detail(@RequestParam int mbtiBoardNo, Model model) {
		MbtiMemberListVO mbtiMemberListVO = mbtiBoardDao.read(mbtiBoardNo);
		model.addAttribute("mbtiMemberListVO", mbtiMemberListVO);

		return "mbtiBoard/detail";
	}

	@PostMapping("/detail/{mbtiBoardNo}")
	public String detail2(@PathVariable int mbtiBoardNo, Model model) {
		MbtiMemberListVO mbtiMemberListVO = mbtiBoardDao.read(mbtiBoardNo);
		model.addAttribute("mbtiMemberListVO", mbtiMemberListVO);

		return "mbtiBoard/detail";
	}

	// 게시글 작성하기 *modal

	@GetMapping("/write")
	public String write() {

		return "mbtiBoard/write";
	}

	@PostMapping("/write")
	public String write(@ModelAttribute MbtiBoardDto mbtiBoardDto, RedirectAttributes attr) {

		// 임시 작성자 추가
		int memberNo = 7;
		mbtiBoardDto.setMemberNo(memberNo);

		int mbtiBoardNo = mbtiBoardDao.write(mbtiBoardDto);

		attr.addAttribute("mbtiBoardNo", mbtiBoardNo);
		return "redirect:detail";

	}

	// 게시글 삭제하기

	@GetMapping("/delete")
	public String delete(@RequestParam int mbtiBoardNo) {
		mbtiBoardDao.delete(mbtiBoardNo);

		return "redirect:list";
	}

	@PostMapping("/delete/{mbtiBoardNo}")
	public String delete2(@RequestParam int mbtiBoardNo, Model model) {

		mbtiBoardDao.delete(mbtiBoardNo);

		return "redirect:/mbtiBoard/list";

	}

	// 게시글 수정하기

	@GetMapping("/edit")
	public String edit(@RequestParam int mbtiBoardNo, Model model) {

		MbtiBoardDto mbtiBoardDto = mbtiBoardDao.info(mbtiBoardNo);
		model.addAttribute("mbtiBoardDto", mbtiBoardDto);

		return "mbtiBoard/edit";

	}

	@PostMapping("/edit")
	public String edit(@ModelAttribute MbtiBoardDto mbtiBoardDto, HttpServletResponse response,
			RedirectAttributes attr) {
		

		boolean success = mbtiBoardDao.edit(mbtiBoardDto);
		if (success) {
			attr.addAttribute("mbtiBoardNo", mbtiBoardDto.getMbtiBoardNo());
			return "redirect:detail";
		}
		return "redirect:detail"; // else 예외처리 구문 추가해야 함

	}

}
