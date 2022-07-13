//package com.kh.e3i1.rest;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.kh.e3i1.repository.MbtiBoardDao;
//import com.kh.e3i1.vo.MbtiMemberListVO;
//
//@RestController
//@RequestMapping("/rest/mbtiBoard")
//public class MbtiBoardRestController {
//
//	@Autowired
//	private MbtiBoardDao mbtiBoardDao;
//	
//	@GetMapping("/")
//	public List<MbtiMemberListVO> list(
//			@RequestParam(required = false) String type,
//			@RequestParam(required = false) String keyword,
//			@RequestParam(required = false, defaultValue = "1") int p,
//			@RequestParam(required = false, defaultValue = "5") int s
//			) {
//
////		List<MbtiMemberListVO> list = mbtiBoardDao.list(type, keyword, p, s);
//		
//		boolean search = type != null && keyword != null;
//		
////		int count = mbtiBoardDao.count(type, keyword);
////		int lastPage = (count + s -1) / s;
//		
//		int blockSize = 5; // 블록 크기
//		int endBlock = (p +blockSize - 1) / blockSize * blockSize;
//		int startBlock = endBlock - (blockSize - 1);
//		if(endBlock > lastPage) {
//			endBlock = lastPage;
//		}
//		System.out.println("p=" + p);
//		System.out.println("s=" + s);
//		System.out.println("lastPage = " + lastPage);
//		System.out.println("endBlock = " + endBlock);
//		System.out.println("startBlock = " + startBlock);
//		
////		System.out.println(mbtiBoardDao.list(type, keyword, p, s).size());
////		
////		return mbtiBoardDao.list(type, keyword, p, s);
//	}
//}
