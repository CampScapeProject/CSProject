package com.sist.rest;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.RentDAO;
import com.sist.mail.MailManager;
import com.sist.vo.*;


import java.io.File;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

@RestController
@CrossOrigin({"http://211.238.142.111","http://localhost"})
public class RentRestController {
	@Autowired
	private RentDAO dao;
	@Autowired
	private MailManager mailManager;
	
	@GetMapping(value = "rent/rentList_vue.do", produces = "text/plain;charset=UTF-8")
	public String rentList(String date, boolean all, OArray oArray, String id) throws Exception {
		String sDate=date.split(" - ")[0];
		String eDate=date.split(" - ")[1];
		
		SimpleDateFormat fm=new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilSdate=fm.parse(sDate);
		java.sql.Date sqlSdate=new java.sql.Date(utilSdate.getTime());

		java.util.Date utilEdate=fm.parse(eDate);
		java.sql.Date sqlEdate=new java.sql.Date(utilEdate.getTime());
		
		Map map=new HashMap();
		map.put("id", id);
		map.put("sDate", sqlSdate);
		map.put("eDate", sqlEdate);
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
	
	@GetMapping(value = "rent/my_review_page_vue.do", produces = "text/plain;charset=UTF-8")
	public String my_rent_page(String id, int curpage) throws Exception {
		int totalpage=dao.reviewTotalPage(id);
		final int BLOCK=5;
		int startpage=(curpage-1)/BLOCK*BLOCK+1;
		int endpage=(curpage-1)/BLOCK*BLOCK+BLOCK;
		
		if(endpage>totalpage)
			endpage=totalpage;
		
		Map map=new HashMap();
		map.put("curpage", curpage);
		map.put("totalpage", totalpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		
		ObjectMapper mapper=new ObjectMapper();
		return mapper.writeValueAsString(map);
	}
	
	//관리자 페이지
	@GetMapping(value = "rent/admin_rent_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String admin_rent_list(int curpage, String fd) throws Exception {
		int rowsize=7;
		int start=rowsize*curpage-(rowsize-1);
		int end=rowsize*curpage;
		
		Map map=new HashedMap();
		map.put("start", start);
		map.put("end", end);
		map.put("fd", fd);
		
		List<RentVO> list=dao.adminRentListData(map);
		
		
		int totalpage=dao.adminRentTotalpage(fd);
		final int BLOCK=5;
		int startpage=(curpage-1)/BLOCK*BLOCK+1;
		int endpage=(curpage-1)/BLOCK*BLOCK+BLOCK;
		if(endpage>totalpage)
			endpage=totalpage;
		
		Map smap=new HashMap();
		smap.put("curpage", curpage);
		smap.put("totalpage", totalpage);
		smap.put("startpage", startpage);
		smap.put("endpage", endpage);
		smap.put("list", list);
		
		
		ObjectMapper mapper=new ObjectMapper();
		
		return mapper.writeValueAsString(smap);
	}
	
	//렌터카 등록
	@PostMapping(value = "admin_rent_insert_vue.do", produces = "text/plain;charset=UTF-8")
	public String admin_rent_insert(RentVO vo, MultipartFile imagefile, HttpServletRequest request) {
		
		String path = request.getSession().getServletContext().getRealPath("/")+"layout\\upload-rent\\"+imagefile.getOriginalFilename();
		path=path.replace("\\", File.separator); // os에 따른 경로 구분자 변경
		
		try {
			imagefile.transferTo(new File(path));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		vo.setImage("../layout/upload-rent/"+imagefile.getOriginalFilename());
		
		System.out.println(vo.getCar_name());
		System.out.println(vo.getCar_type());
		System.out.println(vo.getInwon());
		System.out.println(vo.getPrice());
		System.out.println(vo.getImage());
		System.out.println(vo.getFuel());
		System.out.println(vo.getMaker());
		System.out.println(vo.getCar_option());
		dao.insertRent(vo);
		
		return "";
	}
	
	@PostMapping(value = "admin_rent_update_vue.do", produces = "text/plain;charset=UTF-8")
	public String admin_rent_update(RentVO vo, MultipartFile imagefile, HttpServletRequest request) {
		if(imagefile!=null) {
			String path = request.getSession().getServletContext().getRealPath("/")+"layout\\upload-rent\\"+imagefile.getOriginalFilename();
			path=path.replace("\\", File.separator); // os에 따른 경로 구분자 변경
			
			try {
				imagefile.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}
			vo.setImage("../layout/upload-rent/"+imagefile.getOriginalFilename());
		}
		
//		System.out.println(vo.getRno());
//		System.out.println(vo.getCar_name());
//		System.out.println(vo.getCar_type());
//		System.out.println(vo.getInwon());
//		System.out.println(vo.getPrice());
//		System.out.println(vo.getImage());
//		System.out.println(vo.getFuel());
//		System.out.println(vo.getMaker());
//		System.out.println(vo.getCar_option());

		dao.updateRent(vo);
		
		return "";
	}
	
	@GetMapping(value = "rent/admin_rent_reserve_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String admin_rent_reserve_list(String fd, int type) throws Exception{
		Map map=new HashMap();
		map.put("fd", fd);
		map.put("type", type);
		
		List<ReserveVO> list=dao.adminReserveListData(map);
		
		ObjectMapper mapper=new ObjectMapper();
		return mapper.writeValueAsString(list);
	}
	
	@GetMapping(value = "rent/reserve_delete_vue.do", produces = "text/plain;charset=UTF-8")
	public String reserve_delete(int rsno) {
		dao.reserveDelete(rsno);
		return "";
	}
	
	@GetMapping(value = "rent/reserve_ok_vue.do", produces = "text/plain;charset=UTF-8")
	public String reserve_ok(int rsno) {
		dao.reserveOk(rsno);
		
		ReserveVO vo=dao.reserveOkMailData(rsno);
		mailManager.rentReserveOkMail(vo);
		return "";
	}
	
	@GetMapping(value = "rent/home_rent_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String home_rent_list() throws Exception {
		List<RentVO> list=dao.home_rent_list();
		
		ObjectMapper mapper=new ObjectMapper();
		return mapper.writeValueAsString(list);
	}
}
