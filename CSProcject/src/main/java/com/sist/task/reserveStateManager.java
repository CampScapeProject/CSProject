package com.sist.task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.sist.dao.RentDAO;

@Component
public class reserveStateManager {
	@Autowired
	private RentDAO dao;
	
	@Scheduled(fixedRate = 60000)
	public void rentStateUpdate() {
		dao.rstateUpdate();
	}
}
