package com.sist.rest;

import java.util.*;

import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;
import com.sist.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class NoticeRestController {
	
	@Autowired
	private NoticeDAO dao;
	
	@GetMapping(value = "notice/notice_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String notice_list_vue(int page) throws Exception
	{	
		Map map = new HashMap();
		int rowSize = 10;
		int start = (rowSize*page)-(rowSize-1);
		int end = rowSize*page;
		map.put("start", start);
		map.put("end", end);
		
		List<NoticeVO> list = dao.noticeListData(map);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value = "notice/notice_page_vue.do", produces = "text/plain;charset=UTF-8")
	public String notice_page(int page) throws Exception
	{
		int totalpage = dao.noticeTotalpage();
		
		final int BLOCK = 5;
		int startpage = ((page-1)/BLOCK*BLOCK)+1;
		int endpage = ((page-1)/BLOCK*BLOCK)+BLOCK;
		
		PageVO vo = new PageVO();
		vo.setTotalpage(totalpage);
		vo.setCurpage(page);
		vo.setStartpage(startpage);
		vo.setEndpage(endpage);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		return json;
	}
	
	@PostMapping(value = "notice/notice_insert_vue.do", produces = "text/plain;charset=UTF-8")
	public String notice_insert_ok(String title, String content, int fix, HttpSession session)
	{
		String id = (String)session.getAttribute("id");
		
		NoticeVO vo = new NoticeVO();
		vo.setTitle(title);
		vo.setId(id);
		vo.setContent(content);
		vo.setFix(fix);
		
		System.out.println(vo.getId());
		System.out.println(vo.getTitle());
		System.out.println(vo.getContent());
		System.out.println(vo.getFix());
		
		dao.noticeInsert(vo);
		
		return "../notice/notice_main.do";
	}
	
	@GetMapping(value = "notice/notice_detail_vue.do", produces = "text/plain;charset=UTF-8")
	public String notice_detail(int nno) throws Exception
	{
		NoticeVO vo = dao.noticeDetailData(nno);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		return json;
	}
	
	
}
