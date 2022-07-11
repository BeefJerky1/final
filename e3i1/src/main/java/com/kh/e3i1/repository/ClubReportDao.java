package com.kh.e3i1.repository;

import com.kh.e3i1.entity.ClubBoardReplyDto;
import com.kh.e3i1.entity.ClubReportDto;

public interface ClubReportDao {

	int reportBoard(ClubReportDto clubReportDto);

	int findReport(int clubReportTarget, int clubReportReporter);

	int reportReply(ClubReportDto clubReportDto);

	void calculateReplyCount(int replyNo);


}
