package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.ClubLikeDto;
import com.kh.e3i1.entity.ClubMemberDto;
import com.kh.e3i1.vo.ClubComplexSearchVO;
import com.kh.e3i1.vo.ClubDetailVO;
import com.kh.e3i1.vo.ClubLikeVO;
import com.kh.e3i1.vo.ClubListVO;

public interface ClubDao {

	List<ClubListVO> list(int page, String orderType);
	
	List<ClubListVO> searchList(ClubComplexSearchVO clubComplexSearchVO);

	int create(ClubDto clubDto);

	ClubDetailVO detail(int clubNo);

	boolean isLike(int clubNo, int memberNo);
	
	int likeClub(ClubLikeDto clubLikeDto);
	
	public int editClub(ClubDto clubDto);

	List<ClubDto> search(String keyword);

	List<ClubLikeVO> bestClub();
	
	void clubPlus(int clubPlusNo, int clubNo);

	boolean isLimit(int clubNo, int clubPlusNo);

	ClubMemberDto isClubMember(int clubNo, int memberNo);

	List<ClubDto> isClubLeader(int memberNo);

	int passLeader(ClubDto clubDto); 

}
