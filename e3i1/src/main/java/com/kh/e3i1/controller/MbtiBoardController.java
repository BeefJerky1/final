package com.kh.e3i1.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.e3i1.entity.MbtiBoardDto;
import com.kh.e3i1.entity.MbtiBoardLikeDto;
import com.kh.e3i1.entity.MbtiBoardVoteDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.repository.MbtiBoardDao;
import com.kh.e3i1.repository.MbtiBoardLikeDao;
import com.kh.e3i1.repository.MemberDao;
import com.kh.e3i1.vo.MbtiMemberListVO;

@CrossOrigin(origins = {"http://127.0.0.1:5500"})
@Controller
@RequestMapping("/mbtiBoard")
public class MbtiBoardController {

	@Autowired
	private MbtiBoardDao mbtiBoardDao;
	
	@Autowired
	private MbtiBoardLikeDao mbtiBoardLikeDao;

	@Autowired
	private MemberDao memberDao;

//	// 목록 조회
//	@GetMapping("/list")
//	public String list(@RequestParam(required = false) String type, @RequestParam(required = false) String keyword,
//			Model model) {
//
//		List<MbtiMemberListVO> list = mbtiBoardDao.list(type, keyword);
//		model.addAttribute("list", list);
//
//		boolean search = type != null && keyword != null;
//		model.addAttribute("search", search);
//
//		model.addAttribute("type", type);
//		model.addAttribute("keyword", keyword);
//
//		return "mbtiBoard/list";
//
//	}
	
	
	// 게시판 목록 구현
			@GetMapping("/list")
			public String list(
					@RequestParam(required = false) String keyword,
					@RequestParam(required = false, defaultValue = "1") int p,
					@RequestParam(required = false, defaultValue = "5") int s,
					Model model){
			
				List<MbtiMemberListVO> list = mbtiBoardDao.list(keyword, p, s);
				model.addAttribute("list", list);
				
				boolean search = keyword != null;
				model.addAttribute("search", search);
				
				int count = mbtiBoardDao.count(keyword);
				int lastPage = (count + s -1) / s;
				
				int blockSize = 5; // 블록 크기
				int endBlock = (p +blockSize - 1) / blockSize * blockSize;
				int startBlock = endBlock - (blockSize - 1);
				if(endBlock > lastPage) {
					endBlock = lastPage;
				}
				
				model.addAttribute("page", p);
				model.addAttribute("s", s);
				model.addAttribute("keyword", keyword);
				model.addAttribute("startBlock", startBlock);
				model.addAttribute("endBlock", endBlock);
				model.addAttribute("lastPage", lastPage);
				
				
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
		
		MbtiBoardLikeDto mbtiBoardLikeDto = new MbtiBoardLikeDto();
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
		
		mbtiBoardLikeDto.setItLike(itLike);
		model.addAttribute("itLike", itLike);
		model.addAttribute("mbtiBoardLikeDto", mbtiBoardLikeDto);
		
		
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
