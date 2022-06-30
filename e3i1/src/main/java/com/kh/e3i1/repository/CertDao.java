package com.kh.e3i1.repository;

import com.kh.e3i1.entity.CertDto;

public interface CertDao {
	void insert(CertDto certDto);
	boolean check(CertDto certDto);
	void clear();
}
