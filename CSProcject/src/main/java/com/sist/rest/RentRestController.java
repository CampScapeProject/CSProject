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

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

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
	
	@GetMapping(value = "rent/rent_cookie.do", produces = "text/plain;charset=UTF-8")
	public String rentCookieData(HttpServletRequest request) throws Exception {
		Cookie[] cookies=request.getCookies();

		List<RentVO> clist=new ArrayList<RentVO>();
		if(cookies!=null) {
			for(int i=cookies.length-1;i>=0;i--) {
				String key=cookies[i].getName();
				if(key.startsWith("rent_")) {
					String data=cookies[i].getValue();
					RentVO vo=new RentVO();
					vo=dao.rentCookieData(Integer.parseInt(data.split("#")[0]));
					String name=vo.getCar_name();
					if(name.length()>7) {
						vo.setCar_name(name.substring(0,7)+"..");
					}
					vo.setDate(data.split("#")[1].replace("+", " "));
					clist.add(vo);
				}
			}
		}
		
		ObjectMapper mapper=new ObjectMapper();
		return mapper.writeValueAsString(clist);
	}
	
	@GetMapping(value = "rent/rentDetail_vue.do", produces = "text/plain;charset=UTF-8")
	public String rentDetail(int rno) throws Exception {
		RentVO vo=dao.rentDetailData(rno);
		
		ObjectMapper mapper=new ObjectMapper();
		return mapper.writeValueAsString(vo);
	}
}
