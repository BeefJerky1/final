package com.kh.e3i1.repository;

import com.kh.e3i1.entity.MemberProfileDto;

public interface MemberProfileDao {

	int insert(int memberNo, int attachNo);

	int update(int memberNo, int attachNo);
	
	MemberProfileDto one(int memberNo);
}
