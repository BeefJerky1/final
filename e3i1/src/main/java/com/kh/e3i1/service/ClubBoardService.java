package com.kh.e3i1.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.ClubBoardDto;

public interface ClubBoardService {

	ClubBoardDto insert(ClubBoardDto clubBoardDto, List<MultipartFile> clubBoardAttach) throws IllegalStateException, IOException;

	ClubBoardDto insert(ClubBoardDto clubBoardDto, MultipartFile clubBoardAttach) throws IllegalStateException, IOException;

	ClubBoardDto editClubBoard(ClubBoardDto clubBoardDto, List<MultipartFile> files)throws IllegalStateException, IOException;

}
