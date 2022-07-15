package com.kh.e3i1.repository;

import java.io.IOException;
import java.util.List;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.AttachmentDto;
import com.kh.e3i1.vo.AnimalPhotoVO;


public interface AttachmentDao {
	int save(MultipartFile attachment) throws IllegalStateException, IOException;

	AttachmentDto info(int attachmentNo);

	ByteArrayResource load(String attachmentSavename) throws IOException;
	
	public int delete(int attachNo);
	
	public int edit(MultipartFile attachment, int attachNo) throws IllegalStateException, IOException;

	int basic(AnimalPhotoVO animalPhotoVO) throws IllegalStateException, IOException; 
}
