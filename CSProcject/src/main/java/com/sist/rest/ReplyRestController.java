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
public class ReplyRestController {
	
	@Autowired
	private ReplyDAO dao;
	
	@GetMapping(value = "recipe/reply_list_vue.do",  produces = "text/plain;charset=UTF-8")
	public String reply_list_vue(int rno)
	{
		String json = "";
		
		try {
			List<ReplyVO> list = dao.recipeReplyList(rno);
			ObjectMapper mapper = new ObjectMapper();
			json = mapper.writeValueAsString(list);
		}catch(Exception ex) {}
		
		return json;
	}
	
	@PostMapping(value = "recipe/reply_insert_vue.do", produces = "text/plain;charset=UTF-8")
	public String reply_insert(ReplyVO vo, HttpSession session)
	{
		String id = (String)session.getAttribute("id");
		String nickname = (String)session.getAttribute("nickname");
		vo.setId(id);
		vo.setNickname(nickname);
		dao.recipeReplyInsert(vo);
		
		return reply_list_vue(vo.getRno());
	}
	
	@GetMapping(value = "recipe/reply_delete_vue.do", produces = "text/plain;charset=UTF-8")
	public String reply_delete(int rpno, int rno)
	{
		dao.recipeReplyDelete(rpno);
		return reply_list_vue(rno);
	}
	
	@PostMapping(value = "recipe/reply_update_vue.do", produces = "text/plain;charset=UTF-8")
	public String reply_update(ReplyVO vo)
	{
		dao.recipeReplyUpdate(vo);
		return reply_list_vue(vo.getRno());
	}
}
