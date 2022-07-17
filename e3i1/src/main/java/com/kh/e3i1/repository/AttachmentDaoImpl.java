package com.kh.e3i1.repository;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.AttachmentDto;
import com.kh.e3i1.vo.AnimalPhotoVO;

@Repository
public class AttachmentDaoImpl implements AttachmentDao {
	@Autowired
	private SqlSession sqlSession;

	private File directory = new File(System.getProperty("user.home")+"/upload");
	public AttachmentDaoImpl() {
		directory.mkdirs();
	}
	
	@Override
	public int save(MultipartFile attachment) throws IllegalStateException, IOException {
		int attachNo = sqlSession.selectOne("attachment.sequence");
		
		File target = new File(directory, attachment.getOriginalFilename());
		attachment.transferTo(target); // 저장
		
		sqlSession.insert("attachment.insert",AttachmentDto.builder()
											.attachNo(attachNo)
											.attachUploadname(attachment.getOriginalFilename())
											.type(attachment.getContentType())
											.attachSize(attachment.getSize())
										.build());
		
		return attachNo;
	}

	@Override
	public AttachmentDto info(int attachmentNo) {
		return sqlSession.selectOne("attachment.one",attachmentNo);
	}

	@Override
	public ByteArrayResource load(String attachUploadname) throws IOException {
		File target = new File(directory, attachUploadname);
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
		return resource;
	}
	
	@Override
	public int delete(int attachNo) {
		return sqlSession.delete("attachment.delete",attachNo);
	}
	
	@Override
	public int edit(MultipartFile attachment, int attachNo) throws IllegalStateException, IOException {
		int success = this.save(attachment);
		if(success != 0) {
			this.delete(attachNo);
		}
		return success;
	}
	
}
