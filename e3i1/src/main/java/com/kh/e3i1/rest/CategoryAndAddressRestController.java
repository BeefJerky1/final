package com.kh.e3i1.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.e3i1.entity.Address1Dto;
import com.kh.e3i1.entity.Address2Dto;
import com.kh.e3i1.entity.CategoryDto;
import com.kh.e3i1.repository.CategoryNAddressDao;

@CrossOrigin(
		origins = {"http://127.0.0.1:5500"}
	)
@RestController
@RequestMapping("/rest/category_n_address")
public class CategoryAndAddressRestController {
	
	@Autowired
	private CategoryNAddressDao categoryNAddressDao;
	
	// 카테고리 목록
	@GetMapping("/category1")
	public List<CategoryDto> mainCategoryList(){
		return categoryNAddressDao.mainCategoryList();
	}
	
	// 카테고리 목록
	@GetMapping("/category2/{superNo}")
	public List<CategoryDto> subCategoryList(@PathVariable int superNo){
		return categoryNAddressDao.subCategoryList(superNo);
	}
	
	// 시/도 목록
	@GetMapping("/address1")
	public List<Address1Dto> addressList1(){
		return categoryNAddressDao.addressList1();
	}
	
	// 시/군/구 목록
	@GetMapping("/address2/{address1No}")
	public List<Address2Dto> addressList2(@PathVariable int address1No){
		return categoryNAddressDao.addressList2(address1No);
	}
}
