package com.kh.e3i1.rest;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.ClubBoardAttachDto;
import com.kh.e3i1.entity.ClubBoardDto;
import com.kh.e3i1.entity.ClubBoardLikeDto;
import com.kh.e3i1.entity.ClubBoardReportDto;
import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.ClubMemberDto;
import com.kh.e3i1.entity.ClubReplyLikeDto;
import com.kh.e3i1.entity.MessageDto;
import com.kh.e3i1.repository.ClubBoardDao;
import com.kh.e3i1.repository.ClubBoardLikeDao;
import com.kh.e3i1.repository.ClubMemberDao;
import com.kh.e3i1.repository.ClubReportDao;
import com.kh.e3i1.repository.MessageDao;
import com.kh.e3i1.service.ClubBoardService;
import com.kh.e3i1.vo.ClubBoardListItemVO;
import com.kh.e3i1.vo.ClubDetailVO;
import com.kh.e3i1.vo.ClubMemberProfileVO;

import springfox.documentation.annotations.ApiIgnore;


@RestController
@RequestMapping("/rest/clubboard")
@CrossOrigin(origins = {"http://127.0.0.1:5500"})
public class ClubBoardRestController {
	
	@Autowired
	private ClubBoardDao clubBoardDao;
	@Autowired
	private ClubBoardLikeDao clubBoardLikeDao;
	@Autowired
	private ClubReportDao clubReportDao;
	@Autowired
	private ClubBoardService clubBoardService; 
	@Autowired
	private ClubMemberDao clubMemberDao;
	@Autowired
	private MessageDao messageDao;
	
	//????????? ???????????? ??????
	@GetMapping("/side/{clubNo}/order/{orderType}/{memberNo}")
	public List<ClubBoardDto> Sidelist(
			@PathVariable int clubNo , 
			@PathVariable String orderType,
			@PathVariable int memberNo
			) {
		return clubBoardDao.list(clubNo,orderType,memberNo);
	}
	//??????
	@GetMapping("/{clubNo}/{likeMemberNo}/{column}/{order}")
	public List<ClubBoardListItemVO> list(@PathVariable int clubNo, 
			@PathVariable int likeMemberNo,
			@PathVariable String column,
			@PathVariable String order) {
		return clubBoardDao.listAll(clubNo,likeMemberNo, column, order);
	}
	//??????
	@GetMapping("/{clubNo}/{likeMemberNo}/{column}/{order}/{memberNo}")
	public List<ClubBoardListItemVO> list(@PathVariable int clubNo, 
			@PathVariable int likeMemberNo,
			@PathVariable String column,
			@PathVariable String order,
			@PathVariable int memberNo) {
		return clubBoardDao.listAll2(clubNo,likeMemberNo, column, order,memberNo);
	}
	//??????
	@PostMapping("/")
	public ClubBoardDto insert(@ModelAttribute ClubBoardDto clubBoardDto, 
			@RequestParam(required=false) List<MultipartFile> files)throws IllegalStateException, IOException {
		return clubBoardService.insert(clubBoardDto , files);
	}	
	//??????
	@DeleteMapping("/{clubBoardNo}")
	public int delete(@PathVariable int clubBoardNo) {
		//????????? ?????? ??????
		List<ClubBoardAttachDto> list = clubBoardDao.getAttachNo(clubBoardNo);
		if(list!=null) { //?????? ?????????
			for(ClubBoardAttachDto dto:list) {
				int result = clubBoardDao.deleteAttachNo(dto.getAttachNo());
			}
			return clubBoardDao.delete(clubBoardNo);
		}else {//?????? ?????????
			return clubBoardDao.delete(clubBoardNo);
		}
	}
	//?????? ??????
	@GetMapping("/detail/{clubBoardNo}/memberNo/{memberNo}")
	public ClubBoardListItemVO one(@PathVariable int clubBoardNo ,@PathVariable int memberNo) {	
		return clubBoardDao.detail(clubBoardNo, memberNo);
	}
	
	//??????
	@PostMapping("/editBoard")
	public ClubBoardDto edit(
			@ModelAttribute ClubBoardDto clubBoardDto , 
			@RequestParam(required=false) List<MultipartFile> files
			) throws IllegalStateException, IOException {
		return clubBoardService.editClubBoard(clubBoardDto, files);
	}
	//????????? ???????????? ????????????
	@GetMapping("/attach/{clubBoardNo}")
	public List<ClubBoardAttachDto> getAttachNo(@PathVariable int clubBoardNo){
		return clubBoardDao.getAttachNo(clubBoardNo);
	}
	//????????? ?????? ??????
	@DeleteMapping("/attach/{attachNo}")
	public int deleteAttachNo(@PathVariable int attachNo){
		return clubBoardDao.deleteAttachNo(attachNo);
	}
	//????????? ??????
	@GetMapping("/likecheck/{clubBoardNo}/{likeMemberNo}")
	public int select(@ApiIgnore HttpSession session,@PathVariable int clubBoardNo,@PathVariable int likeMemberNo) {
		return clubBoardLikeDao.findLike(clubBoardNo, likeMemberNo);
	}
	//????????? ??????
	@PostMapping("/like")
	public ClubBoardLikeDto insert(@ApiIgnore HttpSession session, @RequestBody ClubBoardLikeDto clubBoardLikeDto ) {
		int MemberNo = (Integer)session.getAttribute("login");
		clubBoardLikeDto.setLikeMemberNo(MemberNo);
		return clubBoardLikeDao.insert(clubBoardLikeDto);
	}
	//????????? ??????
	@DeleteMapping("/like")
	public void delete(@ApiIgnore HttpSession session, @RequestBody ClubBoardLikeDto clubBoardLikeDto) {
		int MemberNo = (Integer)session.getAttribute("login");
		clubBoardLikeDto.setLikeMemberNo(MemberNo);
		clubBoardLikeDao.delete(clubBoardLikeDto);
	}
	//????????? ???????????? ????????? ??????
	@GetMapping("/likeList/{clubBoardNo}/{likeMemberNo}")
	public int select2(@PathVariable int clubBoardNo ,@PathVariable int likeMemberNo) {
		return clubBoardLikeDao.findLikeList(clubBoardNo,likeMemberNo);
	}
	//??????????????? ????????? ??????
	@GetMapping("/modal/{memberNo}")
	public ClubMemberProfileVO memberProfile(@PathVariable int memberNo) {
		return clubBoardDao.memberProfile(memberNo);
	}
	//????????? ????????????
	@PostMapping("/report")
	public int clubBoardReport(@RequestBody ClubBoardReportDto clubBoardReportDto) {
		return clubReportDao.reportBoard(clubBoardReportDto);
	}
	//?????? ??????//????????? ????????????
	@GetMapping("/reportcheck/{clubReportTarget}/{clubReportReporter}")
	public int searchReport(@ApiIgnore HttpSession session,@PathVariable int clubReportTarget,@PathVariable int clubReportReporter) {
		return clubReportDao.findBoardReport(clubReportTarget, clubReportReporter);
	}
	//????????? ?????? ??????
	@GetMapping("/member/{clubNo}/{memberNo}")
	public int verify(@PathVariable int clubNo, @PathVariable int memberNo){
		return clubMemberDao.check(clubNo, memberNo);		
	}
	//????????? ??????
	@PostMapping("/message")
	public int sendMessage(@RequestBody MessageDto messageDto) {
		return messageDao.sendMessage1(messageDto);
	}
	//????????? ????????????????????? ???????????? ????????????
	@GetMapping("/clubDetail/{clubBoardNo}")
	public ClubDetailVO clubDetail(@PathVariable int clubBoardNo) {
		return clubBoardDao.clubDetail(clubBoardNo);
	}
	
}
