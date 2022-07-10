package com.kh.e3i1.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.ClubDto;


public interface ClubService {
	public int createClub(ClubDto clubDto, MultipartFile memberProfile) throws IllegalStateException, IOException;

	public int editClub(ClubDto clubDto, MultipartFile clubProfile, int attachNo)  throws IllegalStateException, IOException;
}
