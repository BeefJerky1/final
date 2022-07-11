package com.kh.e3i1.service;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.ClubBoardDto;
import com.kh.e3i1.repository.AttachmentDao;
import com.kh.e3i1.repository.ClubBoardAttachDao;
import com.kh.e3i1.repository.ClubBoardDao;

@Service
public class ClubBoardServiceImpl implements ClubBoardService{
	@Autowired
	private ClubBoardDao clubBoardDao;
	@Autowired
	private AttachmentDao attachmentDao;
	@Autowired
	private ClubBoardAttachDao clubBoardAttachDao;
	@Autowired
	private SqlSession sqlSession;
	//게시판 등록 + 단일 이미지 업로드
	@Override
	public ClubBoardDto insert(ClubBoardDto clubBoardDto, MultipartFile clubBoardAttach) throws IllegalStateException, IOException {
		//게시판 생성
		int clubBoardNo = sqlSession.selectOne("clubboard.sequence");
		clubBoardDto.setClubBoardNo(clubBoardNo);
		clubBoardDao.insert(clubBoardDto);
		int attachNo = attachmentDao.save(clubBoardAttach);
		clubBoardAttachDao.insert(attachNo, clubBoardNo,clubBoardDto.getClubNo());
		return clubBoardDto;
	}
	//게시판 등록 + 다중이미지 업로드
	@Override
	public ClubBoardDto insert(ClubBoardDto clubBoardDto, List<MultipartFile> files)
			throws IllegalStateException, IOException {
		
		if(files==null) {			
			int clubBoardNo = sqlSession.selectOne("clubboard.sequence");
			clubBoardDto.setClubBoardNo(clubBoardNo);
			clubBoardDao.insert(clubBoardDto);
		}else {
			int clubBoardNo = sqlSession.selectOne("clubboard.sequence");
			clubBoardDto.setClubBoardNo(clubBoardNo);
			clubBoardDao.insert(clubBoardDto);
			for(MultipartFile attach: files) {
				
				int attachNo = attachmentDao.save(attach);
				clubBoardAttachDao.insert(attachNo, clubBoardNo,clubBoardDto.getClubNo());
			}
		}
		
		return clubBoardDto;
	}

}
