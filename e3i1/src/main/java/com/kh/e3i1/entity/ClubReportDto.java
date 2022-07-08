package com.kh.e3i1.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ClubReportDto {
	private int clubReportNo;
	private int clubNo;
	private int clubReportTarget;
	private int clubReportType;
	private int clubReportWriter;
	private int clubReportReporter;
	private Date clubReportTime;
	private String clubReportCategory;
	private String clubReportContent;
	
}
