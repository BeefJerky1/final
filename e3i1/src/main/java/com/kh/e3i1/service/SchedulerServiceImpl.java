package com.kh.e3i1.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.e3i1.repository.CertDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SchedulerServiceImpl implements SchedulerService {
	
	@Autowired
	private CertDao certDao;
	
	@Scheduled(cron = "0 0 * * * *")//매 정각마다
	
	@Override
	public void clearCertData() {
		log.debug("스케줄러 실행");
		certDao.clear();
	}
	
}



