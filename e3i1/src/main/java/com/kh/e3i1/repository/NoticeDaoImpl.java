package com.kh.e3i1.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.NoticeDto;
import com.kh.e3i1.vo.NoticeDetailVO;
import com.kh.e3i1.vo.NoticeListVO;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<NoticeListVO> list(String type, String keyword, int page, int size) {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		int end = page * size;
		int begin = end - (size - 1);
		param.put("begin", begin);
		param.put("end", end);
		
		return sqlSession.selectList("notice.listde", param);
	}
	
	@Override
	public NoticeDetailVO read(int noticeNo) {
		
		return sqlSession.selectOne("notice.one", noticeNo);
	}
	
	@Override
	public int count(String type, String keyword) {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		return sqlSession.selectOne("notice.count", param);
	}
	
	@Override
	public NoticeDto info(int noticeNo) {
		return sqlSession.selectOne("notice.one", noticeNo);
	}
	
	@Override
	public boolean edit(NoticeDto noticeDto) {
		return sqlSession.update("notice.edit", noticeDto) > 0;
	}
	
	@Override
	public boolean delete(int noticeNo) {
		int count = sqlSession.delete("notice.delete", noticeNo);
		return count > 0;
	}
	
	@Override
	public int write(NoticeDto noticeDto) {
		int noticeNo = sqlSession.selectOne("notice.sequence");
		noticeDto.setNoticeNo(noticeNo);
		
		sqlSession.insert("notice.write", noticeDto);
		return noticeNo;
	}
}
