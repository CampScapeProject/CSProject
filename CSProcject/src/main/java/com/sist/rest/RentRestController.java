package com.sist.rest;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.RentDAO;
import com.sist.vo.OArray;
import com.sist.vo.RentVO;

import java.util.*;

@RestController
@CrossOrigin({"http://211.238.142.111","http://localhost"})
public class RentRestController {
	@Autowired
	private RentDAO dao;
	
	@GetMapping(value = "rent/rentList_vue.do", produces = "text/plain;charset=UTF-8")
	public String rentList(String date, boolean all, OArray oArray) throws Exception {
		String sDate=date.split(" - ")[0];
		String eDate=date.split(" - ")[1];
		Map map=new HashMap();
		map.put("sDate", sDate);
		map.put("eDate", eDate);
		map.put("all", all);
		map.put("oArray", oArray);
		List<RentVO> list=dao.rentListData(map);
		ObjectMapper mapper=new ObjectMapper();
		return mapper.writeValueAsString(list);
		
	}
}
