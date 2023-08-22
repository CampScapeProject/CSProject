package com.sist.rest;

import java.util.*;
import com.sist.vo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class QnaRestController {
	
	@Autowired
	private QnaDAO dao;
	
	@GetMapping("qna/qna_main_vue.do")
	public String qna_main(int page, int qcno) throws Exception
	{	
		Map map = new HashMap();
		int rowSize=15;
		int start = (rowSize*page)-(rowSize-1);
		int end = rowSize*page;
		map.put("start", start);
		map.put("end", end);
		
		String json = "";
		
		if(qcno==1)
		{
			List<QnaVO> list = dao.qnaListData(map);
			ObjectMapper mapper = new ObjectMapper();
			json = mapper.writeValueAsString(list);
		}
		else {
			map.put("qcno", qcno);
			List<QnaVO> list = dao.qnaCategoryListData(map);
			ObjectMapper mapper = new ObjectMapper();
			json = mapper.writeValueAsString(list);
		}
		
		return json;
	}
	
	@PostMapping("qna/qna_insert_ok_vue.do")
	public String qna_insert(String category, String title, int qcno, String secret)
	{
		
		
		return "";
	}
}
