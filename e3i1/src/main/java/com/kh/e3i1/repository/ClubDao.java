package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.ClubLikeDto;
import com.kh.e3i1.vo.ClubDetailVO;

public interface ClubDao {

	List<ClubDto> list();

	int create(ClubDto clubDto);

	ClubDetailVO detail(int clubNo);

	boolean isLike(int clubNo, int memberNo);
	
	int likeClub(ClubLikeDto clubLikeDto);
}
