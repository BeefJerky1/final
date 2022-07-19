package com.kh.e3i1.repository;

import java.util.List;

import com.kh.e3i1.entity.MbtiBoardReportDto;

public interface MbtiReportDao {

	int reportBoard(MbtiBoardReportDto mbtiBoardReportDto);

	List<MbtiBoardReportDto> list(int mbtiBoardNo);

}
