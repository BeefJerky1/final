package com.kh.e3i1.repository;

import com.kh.e3i1.entity.ClubBoardReplyDto;
import com.kh.e3i1.entity.ClubBoardReportDto;
import com.kh.e3i1.entity.ClubReplyReportDto;

public interface ClubReportDao {

	int reportBoard(ClubBoardReportDto clubReportDto);

	int findBoardReport(int clubReportTarget, int clubReportReporter);
	
	int findReplyReport(int clubReportTarget, int clubReportReporter);

	int reportReply(ClubReplyReportDto clubReportDto);

	void calculateReplyCount(int replyNo);


}
