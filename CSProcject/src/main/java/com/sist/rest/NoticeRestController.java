package com.sist.rest;

import java.util.*;
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
		int rowSize = 15;
		int start = (rowSize*page)-(rowSize-1);
		int end = rowSize*page;
		map.put("start", start);
		map.put("end", end);
		
		List<NoticeVO> list = dao.noticeListData(map);
		return "";
	}
	
	@PostMapping(value = "notice/notice_insert_ok_vue.do", produces = "text/plain;charset=UTF-8")
	public String notice_insert_vue(String title, String content, int fix, MultipartFile image)
	{
		return "";
	}
	
}
