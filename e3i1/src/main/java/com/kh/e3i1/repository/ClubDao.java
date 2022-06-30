package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.ClubDto;

public interface ClubDao {

	List<ClubDto> list();

	int create(ClubDto clubDto);

}
