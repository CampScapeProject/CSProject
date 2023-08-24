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
import com.sist.vo.*;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

@RestController
@CrossOrigin({"http://211.238.142.111","http://localhost"})
public class RentRestController {
	@Autowired
	private RentDAO dao;
	
	@GetMapping(value = "rent/rentList_vue.do", produces = "text/plain;charset=UTF-8")
	public String rentList(String date, boolean all, OArray oArray, String id) throws Exception {
		String sDate=date.split(" - ")[0];
		String eDate=date.split(" - ")[1];
		Map map=new HashMap();
		map.put("id", id);
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
	
	@GetMapping(value = "rent/rent_update_vue.do", produces = "text/plain;charset=UTF-8")
	public String rent_jjim(int rno, boolean jjimOk, String id) {
		Map map=new HashMap();
		map.put("rno", rno);
		map.put("id", id);
		if(jjimOk) {
			dao.jjimDelete(map);
		} else {
			dao.jjimInsert(map);
		}
		return "";
	}
	
	@GetMapping(value = "rent/reviewTotal_vue.do", produces = "text/plain;charset=UTF-8")
	public String reviewTotalData(int rno) throws Exception {
		ReviewVO vo=dao.reviewTotalData(rno);
		
		ObjectMapper mapper=new ObjectMapper();
		return mapper.writeValueAsString(vo);
	}
	
	@GetMapping(value = "rent/review_vue.do", produces = "text/plain;charset=UTF-8")
	public String reviewList(int rno, int curpage, String selected) throws Exception {
		Map map=new HashMap();
		int rowsize=5;
		int start=rowsize*curpage-(rowsize-1);
		int end=rowsize*curpage; 
		map.put("rno", rno);
		map.put("start", start);
		map.put("end", end);
		map.put("selected", selected);
		List<ReviewVO> list=dao.rentReviewList(map);
		
		ObjectMapper mapper=new ObjectMapper();
		
		return mapper.writeValueAsString(list);
	}
	
	@GetMapping(value = "rent/review_page_vue.do", produces = "text/plain;charset=UTF-8")
	public String reviewPage(int rno, int curpage) throws Exception {
		int totalpage=dao.rentReviewTotalpage(rno);
		final int BLOCK=5;
		int startpage=(curpage-1)/BLOCK*BLOCK+1;
		int endpage=(curpage-1)/BLOCK*BLOCK+BLOCK;
		if(endpage>totalpage) {
			endpage=totalpage;
		}
		PageVO vo=new PageVO();
		vo.setCurpage(curpage);
		vo.setStartpage(startpage);
		vo.setEndpage(endpage);
		vo.setTotalpage(totalpage);
		
		
		ObjectMapper mapper=new ObjectMapper();
		return mapper.writeValueAsString(vo);
	}
	
	@GetMapping(value = "rent/memberInfo_vue.do", produces = "text/plain;charset=UTF-8")
	public String memberInfo(String id) throws Exception {
		MemberVO vo=dao.memberInfoData(id);
		
		ObjectMapper mapper=new ObjectMapper();
		return mapper.writeValueAsString(vo);
	}
	
	@PostMapping(value = "rent/reserve_vue.do", produces = "text/plain;charset=UTF-8")
	public String rent_reserve(ReserveVO vo) throws Exception {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date sdate = dateFormat.parse(vo.getDbsdate());
        Date edate = dateFormat.parse(vo.getDbedate());
        vo.setSdate(sdate);
        vo.setEdate(edate);
		dao.rent_reserve_insert(vo);
		return "";
	}
	
	@GetMapping(value = "rent/reserve_check_vue.do", produces = "text/plain;charset=UTF-8")
	public String reserve_check(int rno, String sdate, String edate) {
		Map map=new HashMap();
		map.put("rno", rno);
		map.put("sdate", sdate);
		map.put("edate", edate);
		int count=dao.reserveCheck(map);
		
		return count==0?"Y":"N";
	}
	
	//마이페이지
	@GetMapping(value = "rent/rent_reserve_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String rent_reserve_list(String id) throws Exception {
		List<ReserveVO> list=dao.reserveListData(id);
		DecimalFormat df=new DecimalFormat("###,###");
		for(ReserveVO vo:list) {
			vo.setPrice(df.format(Integer.parseInt(vo.getPrice())));
		}
		
		ObjectMapper mapper=new ObjectMapper();
		return mapper.writeValueAsString(list);
	}
	
	@PostMapping(value = "rent/review_insert_vue.do", produces = "text/plain;charset=UTF-8")
	public String rent_review_insert(int rno,int rank, String content, String id,int rsno) {
		Map map = new HashMap();
		map.put("rno", rno);
		map.put("rank", rank);
		map.put("content", content);
		map.put("id", id);
		map.put("rsno", rsno);
		
		dao.review_insert(map);
		
		return "";
	}
	
	@GetMapping(value = "rent/reserve_cancel_request_vue.do", produces = "text/plain;charset=UTF-8")
	public String rent_reserve_cancel_request(int rno) {
		dao.reserve_cancel_request(rno);
		return "";
	}
	
	@GetMapping(value = "rent/reserve_request_cancel_vue.do", produces = "text/plain;charset=UTF-8")
	public String rent_reserve_request_cancel(int rno) {
		dao.reserve_request_cancel(rno);
		return "";
	}
	
	@GetMapping(value = "rent/review_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String rent_review_list(String id, int curpage) throws Exception {
		int rowsize=7;
		int start=rowsize*curpage-(rowsize-1);
		int end=rowsize*curpage;
		
		Map map=new HashMap();
		map.put("id", id);
		map.put("start", start);
		map.put("end", end);
		
		List<ReviewVO> list=dao.rent_review_list(map);
		
		ObjectMapper mapper=new ObjectMapper();
		return mapper.writeValueAsString(list);
	}
}
