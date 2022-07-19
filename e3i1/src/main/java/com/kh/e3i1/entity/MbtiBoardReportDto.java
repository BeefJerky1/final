package com.kh.e3i1.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MbtiBoardReportDto {
   
    private int mbtiReportNo;
    private int mbtiReportReporter;
    private int mbtiReportWriter;
    private int mbtiReportTarget;
    private String mbtiReportCategory;
    private String mbtiReportContent;
    private Date mbtiReportTime;
    private int mbtiBoardNo;
}
