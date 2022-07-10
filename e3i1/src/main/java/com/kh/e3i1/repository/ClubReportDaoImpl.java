package com.kh.e3i1.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubBoardLikeDto;
import com.kh.e3i1.entity.ClubBoardReplyDto;
import com.kh.e3i1.entity.ClubReportDto;

@Repository 
public class ClubReportDaoImpl implements ClubReportDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override //게시글 신고
	public int reportBoard(ClubReportDto clubReportDto) {
		int clubReportNo = sqlSession.selectOne("clubreport.sequence");
		clubReportDto.setClubReportNo(clubReportNo);
		sqlSession.insert("clubreport.board", clubReportDto);
		ClubReportDto clubreportDto1 = sqlSession.selectOne("clubreport.info", clubReportDto.getClubReportNo());
		if(clubreportDto1 ==null) {
			return 0;
		}else {
			return 1;			
		}
	}
	@Override //댓글 신고
	public int reportReply(ClubReportDto clubReportDto) {
		int clubReportNo = sqlSession.selectOne("clubreport.sequence");
		clubReportDto.setClubReportNo(clubReportNo);
		this.calculateReplyCount(clubReportDto.getClubReportTarget());
		sqlSession.insert("clubreport.reply", clubReportDto);
		ClubReportDto clubreportDto1 = sqlSession.selectOne("clubreport.info", clubReportDto.getClubReportNo());
		if(clubreportDto1 ==null) {
			return 0;
		}else {
			return 1;			
		}
	}
	@Override
	public void calculateReplyCount(int replyNo) {
		sqlSession.update("clubboardreply.calculateReportCount",replyNo);	
	}
	@Override
	public int findReport(int clubReportTarget, int clubReportReporter) {
		ClubReportDto clubReportDto = new ClubReportDto();
		clubReportDto.setClubReportReporter(clubReportReporter);
		clubReportDto.setClubReportTarget(clubReportTarget);
		Integer clubReportNo = sqlSession.selectOne("clubreport.find", clubReportDto);
		if(clubReportNo==null) {
			return 0;
		}else {
			return 1;
		}
	}



	
}
