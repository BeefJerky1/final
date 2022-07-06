package com.kh.e3i1;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.e3i1.entity.ClubBoardDto;
import com.kh.e3i1.entity.ClubBoardLikeDto;
import com.kh.e3i1.entity.ClubBoardReplyDto;
import com.kh.e3i1.vo.ClubBoardListItemVO;
import com.kh.e3i1.vo.ClubBoardReplyListVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
public class Test {
	@Autowired
	private SqlSession sqlSession;
	
//	@org.junit.Test
	public void test() {
		int clubBoardNo = 27;
		List<ClubBoardReplyListVO> list = sqlSession.selectList("clubboardreply.clubReplyTotalList", clubBoardNo);
		for(ClubBoardReplyListVO dto: list) {
			System.out.println(dto);
		}
	}
//	@org.junit.Test
	public void test2() {
		int clubBoardNo =125;
		int likeMemberNo = 3;
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("clubBoardNo", clubBoardNo);
		param.put("likeMemberNo", likeMemberNo);
		Integer cluBboardNo = sqlSession.selectOne("clubboardlike.findlikelist", param);
		log.debug("clubBoardNo ={}",cluBboardNo);
	}
	@org.junit.Test
	public void test3() {
		ClubBoardLikeDto clubBoardLikeDto = new ClubBoardLikeDto();
		int likeMemberNo = 3;
		int clubBoardNo = 124;
		clubBoardLikeDto.setLikeMemberNo(likeMemberNo);
		clubBoardLikeDto.setClubBoardNo(clubBoardNo);
		int checkLike = sqlSession.selectOne("clubboardlike.checkLike", clubBoardLikeDto);
		log.debug("checklike = {}" , checkLike);
	}
}
