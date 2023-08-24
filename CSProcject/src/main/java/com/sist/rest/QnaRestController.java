package com.sist.rest;

import java.util.*;

import javax.servlet.http.HttpSession;

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
	 
	@GetMapping(value = "qna/qna_main_vue.do", produces = "text/plain;charset=UTF-8")
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
	
	@GetMapping(value = "qna/qna_page_vue.do", produces = "text/plain;charset=UTF-8")
	public String qna_page(int page) throws Exception
	{
		int totalpage = dao.qnaTotalpage();
		
		final int BLOCK = 5;
		int startpage = ((page-1)/BLOCK*BLOCK)+1;
		int endpage = ((page-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endpage>totalpage)
			endpage = totalpage;

		PageVO vo = new PageVO();
		vo.setTotalpage(totalpage);
		vo.setCurpage(page);
		vo.setStartpage(startpage);
		vo.setEndpage(endpage);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		return json;
	}
	 
	@PostMapping(value = "qna/qna_insert_ok_vue.do", produces = "text/plain;charset=UTF-8")
	public void qna_insert_ok(String title, String content, int qcno, String open, HttpSession session)
	{
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		
		QnaVO vo = new QnaVO();
		vo.setQcno(qcno);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setId(id);
		vo.setName(name);
		vo.setOpen(open);
		dao.qnaInsert(vo);
	}
	
	@GetMapping(value = "qna/qna_detail_vue.do", produces = "text/plain;charset=UTF-8")
	public String qna_detail(int qno) throws Exception
	{
		
		QnaVO vo = dao.qnaDetailData(qno);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		return json;
	}
	
	@PostMapping(value = "qna/reply_insert_vue.do", produces = "text/plain;charset=UTF-8")
	public void reply_insert(int root, String title, String content, String user_id, HttpSession session)
	{
		
		QnaVO vo = new QnaVO();
		
		vo.setId(user_id);
		vo.setName("관리자");
		vo.setTitle(title);
		vo.setContent(content);
		
		dao.qnaReplyInsert(root, vo);
	}
	
	@GetMapping(value = "qna/qna_delete_vue.do", produces = "text/plain;charset=UTF-8")
	public void qna_delete(int qno)
	{
		dao.qnaDelete(qno);
	}
	
}
