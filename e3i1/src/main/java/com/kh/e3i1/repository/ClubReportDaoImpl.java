package com.kh.e3i1.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubBoardLikeDto;
import com.kh.e3i1.entity.ClubBoardReplyDto;
import com.kh.e3i1.entity.ClubBoardReportDto;
import com.kh.e3i1.entity.ClubReplyReportDto;

@Repository 
public class ClubReportDaoImpl implements ClubReportDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override //게시글 신고
	public int reportBoard(ClubBoardReportDto clubBoardReportDto) {
		int clubReportNo = sqlSession.selectOne("clubreport.sequence");
		clubBoardReportDto.setClubReportNo(clubReportNo);
		sqlSession.insert("clubreport.board", clubBoardReportDto);
		ClubBoardReportDto clubreportDto1 = sqlSession.selectOne("clubreport.boardInfo", clubBoardReportDto.getClubReportNo());
		if(clubreportDto1 ==null) {
			return 0;
		}else {
			return 1;			
		}
	}
	@Override //댓글 신고
	public int reportReply(ClubReplyReportDto clubReplyReportDto) {
		int clubReportNo = sqlSession.selectOne("clubreport.sequence");
		clubReplyReportDto.setClubReportNo(clubReportNo);
		this.calculateReplyCount(clubReplyReportDto.getClubReportTarget());
		sqlSession.insert("clubreport.reply", clubReplyReportDto);
		ClubReplyReportDto clubreportDto1 = sqlSession.selectOne("clubreport.replyInfo", clubReplyReportDto.getClubReportNo());
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
	public int findBoardReport(int clubReportTarget, int clubReportReporter) {
		ClubBoardReportDto clubBoardReportDto = new ClubBoardReportDto();
		clubBoardReportDto.setClubReportReporter(clubReportReporter);
		clubBoardReportDto.setClubReportTarget(clubReportTarget);
		Integer clubReportNo = sqlSession.selectOne("clubreport.boardFind", clubBoardReportDto);
		if(clubReportNo==null) {
			return 0;
		}else {
			return 1;
		}
	}
	@Override
	public int findReplyReport(int clubReportTarget, int clubReportReporter) {
		ClubReplyReportDto clubReplyReportDto = new ClubReplyReportDto();
		clubReplyReportDto.setClubReportReporter(clubReportReporter);
		clubReplyReportDto.setClubReportTarget(clubReportTarget);
		Integer clubReportNo = sqlSession.selectOne("clubreport.replyFind", clubReplyReportDto);
		if(clubReportNo==null) {
			return 0;
		}else {
			return 1;
		}
	}



	
}
