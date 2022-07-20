package com.kh.e3i1.repository;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.web.bind.annotation.PathVariable;

import com.kh.e3i1.entity.ClubBoardAttachDto;
import com.kh.e3i1.entity.ClubBoardDto;
import com.kh.e3i1.entity.ClubBoardLikeDto;
import com.kh.e3i1.vo.ClubBoardListItemVO;
import com.kh.e3i1.vo.ClubDetailVO;
import com.kh.e3i1.vo.ClubMemberProfileVO;

public interface ClubBoardDao {

	List<ClubBoardDto> list(int clubNo,String orderType, int memberNo);

	ClubBoardDto insert(ClubBoardDto clubBoardDto);

	int delete(int clubBoardNo);

	ClubBoardListItemVO detail(int clubBoardNo, int memberNo);
	
	ClubBoardListItemVO detail(int clubBoardNo);

	ClubBoardDto edit(ClubBoardDto clubBoardDto);

	List<ClubBoardListItemVO> clubBoardListItem(int clubNo);

	List<ClubBoardListItemVO> listAll(int clubNo, int likeMemberNo, String column, String order);

	ClubBoardDto readcount(int clubBoardNo);

	ClubMemberProfileVO memberProfile(int memberNo);

	void calculateReportCount(int clubNo);
	
	void calculateReplyCount(int clubNo);

	void calculateLikeCount(int clubNo);

	//게시글 사진번호 가져오기
	List<ClubBoardAttachDto> getAttachNo(int clubBoardNo);
	
	//게시글 사진 삭제
	int deleteAttachNo(int attachNo);
	
	//게시글 상세 페이지에서 클럽정보 조회
	ClubDetailVO clubDetail(int clubBoardNo);
	//해당 회원의 게시글만 보기
	List<ClubBoardListItemVO> listAll2(int clubNo, int likeMemberNo, String column, String order, int memberNo);



}
