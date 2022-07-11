package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.ClubLikeDto;
import com.kh.e3i1.vo.ClubDetailVO;
import com.kh.e3i1.vo.ClubListVO;

public interface ClubDao {

	List<ClubListVO> list();

	int create(ClubDto clubDto);

	ClubDetailVO detail(int clubNo);

	boolean isLike(int clubNo, int memberNo);
	
	int likeClub(ClubLikeDto clubLikeDto);
	
	public int editClub(ClubDto clubDto);
}
