package com.kh.e3i1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.Address1Dto;
import com.kh.e3i1.entity.Address2Dto;
import com.kh.e3i1.entity.CategoryDto;
import com.kh.e3i1.vo.AnimalPhotoVO;
import com.kh.e3i1.vo.MbtiRankVO;

@Repository
public class CategoryNAddressDaoImpl implements CategoryNAddressDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CategoryDto> mainCategoryList() {
		return sqlSession.selectList("category.list1");
	}
	
	@Override
	public List<CategoryDto> subCategoryList(String clubMainCategory) {
		CategoryDto categoryDto = sqlSession.selectOne("category.one",clubMainCategory);
		return sqlSession.selectList("category.list2", categoryDto.getCategoryNo());
	}

	@Override
	public List<Address1Dto> addressList1() {
		return sqlSession.selectList("address.list1");
	}
	
	@Override
	public List<Address2Dto> addressList2(int address1No) {
		return sqlSession.selectList("address.list2", address1No);
	}

	// mbti별 동물
	@Override
	public String animal(String mbti) {
		return sqlSession.selectOne("mbti.animal",mbti);
	}
	
	// mbti에 맞는 동물 사진
	@Override
	public AnimalPhotoVO animalPhoto(String mbti) {
		return sqlSession.selectOne("mbti.mbtiAnimalPhoto",mbti);
	}

	@Override
	public List<MbtiRankVO> mbtiRank(int clubNo) {
		return sqlSession.selectList("mbti.mbtiRank",clubNo);
	}
	
}
