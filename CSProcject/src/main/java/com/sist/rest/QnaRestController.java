package com.sist.rest;

import java.util.*;
import com.sist.vo.*;
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
	public String qna_main()
	{
		
		Map map = new HashMap();
		
		List<QnaVO> list = dao.qnaListData(map);
		return "";
	}
	
	@PostMapping("qna/qna_insert_ok_vue.do")
	public String qna_insert(String category, String title, String content, String secret)
	{
		return "";
	}
}
