package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.ClubBoardDto;

public interface ClubBoardDao {

	List<ClubBoardDto> list(int clubNo);

}
