package com.kh.e3i1.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.MbtiAnimalDto;

public interface AdminService {

	int insertPhoto(MbtiAnimalDto mbtiAnimalDto, MultipartFile files) throws IllegalStateException, IOException;

}
