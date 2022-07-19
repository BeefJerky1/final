package com.kh.e3i1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.MbtiBoardReportDto;

@Repository
public class MbtiReportDaoImpl implements MbtiReportDao {
	@Autowired
	private SqlSession sqlSession;
	
	
	// 게시글 신고하기
	@Override
	public int reportBoard(MbtiBoardReportDto mbtiBoardReportDto) {
		int mbtiReportNo = sqlSession.selectOne("mbtiBoardReport.sequence");
		mbtiBoardReportDto.setMbtiReportNo(mbtiReportNo);
		
		sqlSession.insert("mbtiBoardReport.board", mbtiBoardReportDto);
		MbtiBoardReportDto mbtiBoardReportDto2 =
				 sqlSession.selectOne("mbtiBoardReport.boardInfo", mbtiBoardReportDto.getMbtiReportNo());
		
		if(mbtiBoardReportDto2 == null) {
			return 0;
		} else {
			return 1;
		}
	}

	// 게시글 신고정보 불러오기
	@Override
	public List<MbtiBoardReportDto> list(int mbtiBoardNo) {
		return sqlSession.selectList("mbtiBoardReport.list", mbtiBoardNo);
	}

}
