package com.sist.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.RentDAO;

@RestController
public class RentRestController {
	@Autowired
	private RentDAO dao;
	
	@GetMapping(value = "rent/rentList_vue.do", produces = "text/plain;charset=UTF-8")
	public String rentList(String date) {
		System.out.println(date);
		return "";
	}
}
