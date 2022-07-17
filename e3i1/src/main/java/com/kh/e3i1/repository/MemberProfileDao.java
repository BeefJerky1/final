package com.kh.e3i1.repository;

import com.kh.e3i1.vo.AnimalPhotoVO;

public interface MemberProfileDao {

	int insert(int memberNo, int attachNo);

	int update(int memberNo, int attachNo);

}
