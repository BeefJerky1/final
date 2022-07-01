package com.kh.e3i1.repository;

import java.io.File;
import java.io.IOException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.AttachmentDto;

@Repository
public class AttachmentDaoImpl implements AttachmentDao {
	@Autowired
	private SqlSession sqlSession;
	
	// 저장 위치 
	private File directory = new File(System.getProperty("user.home")+"/upload");
	public AttachmentDaoImpl() {
		directory.mkdirs();
	}
	
	@Override
	public int save(MultipartFile attachment) throws IllegalStateException, IOException {
		int attachNo = sqlSession.selectOne("attachment.sequence");
		
		String fileName = String.valueOf(attachNo);
		File target = new File(directory, fileName);
		attachment.transferTo(target); // 저장
		
		sqlSession.insert("attachment.insert",AttachmentDto.builder()
											.attachNo(attachNo)
											.attachUploadname(attachment.getOriginalFilename())
											.type(attachment.getContentType())
											.attachSize(attachment.getSize())
										.build());
		
		return attachNo;
	}

//	@Override
//	public AttachmentDto info(int attachmentNo) {
//		return sqlSession.selectOne("attachment.one",attachmentNo);
//	}
//
//	@Override
//	public ByteArrayResource load(String attachUploadname) throws IOException {
//		File target = new File(directory, attachUploadname);
//		byte[] data = FileUtils.readFileToByteArray(target);
//		ByteArrayResource resource = new ByteArrayResource(data);
//		return resource;
//	}
}