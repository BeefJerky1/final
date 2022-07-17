package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.ClubLikeDto;
import com.kh.e3i1.vo.ClubComplexSearchVO;
import com.kh.e3i1.vo.ClubDetailVO;
import com.kh.e3i1.vo.ClubLikeVO;
import com.kh.e3i1.vo.ClubListVO;
import com.kh.e3i1.vo.ClubMemberListVO;
import com.kh.e3i1.vo.ClubMemberProfileVO;

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

}
