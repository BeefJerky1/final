package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.Address1Dto;
import com.kh.e3i1.entity.Address2Dto;
import com.kh.e3i1.entity.CategoryDto;
import com.kh.e3i1.vo.AnimalPhotoVO;
import com.kh.e3i1.vo.MbtiRankVO;

public interface CategoryNAddressDao {

	List<CategoryDto> mainCategoryList();
	List<CategoryDto> subCategoryList(String clubMainCategory);
	List<Address1Dto> addressList1();
	List<Address2Dto> addressList2(int address1No);
	String animal(String mbti);
	AnimalPhotoVO animalPhoto(String mbti);
	List<MbtiRankVO> mbtiRank(int clubNo);
}
