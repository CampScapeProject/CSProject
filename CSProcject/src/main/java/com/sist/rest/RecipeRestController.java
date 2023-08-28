package com.sist.rest;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;
import com.sist.vo.*;

import oracle.jdbc.proxy.annotation.Post;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RecipeRestController {
	
	@Autowired
	private RecipeDAO dao;
	
	@GetMapping(value = "recipe/recipe_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String recipeList(int page, String fd) throws Exception
	{
		Map map = new HashMap();
		int rowSize = 12;
		int start = (rowSize*page)-(rowSize-1);
		int end = rowSize*page;
		
		if(fd==null)
			fd="";
		
		map.put("fd", fd);
		map.put("start", start);
		map.put("end", end);
		
		List<RecipeVO> list = dao.recipeListData(map);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value = "recipe/recipe_page_vue.do", produces = "text/plain;charset=UTF-8")
	public String recipe_page(int page, String fd) throws Exception
	{
		if(fd==null)
			fd="";
		int totalpage = dao.recipeTotalPage(fd);
		
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
	
	@GetMapping(value = "recipe/recipe_detail_vue.do", produces = "text/plain;charset=UTF-8")
	public String recipe_detail(int rno) throws Exception
	{
		RecipeVO vo = dao.recipeDetailData(rno);
		
		String msg2 = vo.getMsg2();
		vo.setPeople(msg2.substring(0, msg2.indexOf(" ")).trim());
		vo.setTime(msg2.substring(msg2.indexOf(" "), msg2.lastIndexOf(" ")).trim());
		vo.setLevel(msg2.substring(msg2.lastIndexOf(" ")).trim());
		
		String ingre = vo.getIngre();
		vo.setIngre(ingre.replace("구매", ""));
		
		vo.setIngre_title(ingre.substring(ingre.indexOf(" "), ingre.indexOf("[")).trim());
		vo.setIngre(ingre.substring(ingre.indexOf("[")).trim());
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		return json;
	}
	
	// 댓글
	@GetMapping(value = "recipe/comment_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String recipe_comment_list(int rno)
	{
		String json = "";
		
		try {
			List<CommentVO> list = dao.CommentListData(rno);
			ObjectMapper mapper = new ObjectMapper();
			json = mapper.writeValueAsString(list);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return json;
	}
	
	@PostMapping(value = "recipe/comment_insert_vue.do", produces = "text/plain;charset=UTF-8")
	public String recipe_comment_insert(CommentVO vo, HttpSession session)
	{
		String id = (String)session.getAttribute("id");
		String nickname = (String)session.getAttribute("nickname");
		vo.setId(id);
		vo.setNickname(nickname);
		dao.CommentInsert(vo);
		
		return recipe_comment_list(vo.getRno());
	}
	
	@PostMapping(value = "recipe/comment_update_vue.do", produces = "text/plain;charset=UTF-8")
	public String recipe_comment_update(CommentVO vo)
	{
		dao.CommentUpdate(vo);
		
		return recipe_comment_list(vo.getRno());
	}
	
	@GetMapping(value = "recipe/comment_delete_vue.do", produces = "text/plain;charset=UTF-8")
	public String recipe_comment_delete(int rno, int cmno)
	{
		dao.CommentDelete(cmno);
		
		return recipe_comment_list(rno);
	}
	
	// 마이 페이지
	@GetMapping(value = "recipe/mp_recipe_list.do", produces = "text/plain;charset=UTF-8")
	public String mp_recipe_list(int page, String id) throws Exception
	{
		Map map = new HashMap();
		int rowSize = 12;
		int start = (rowSize*page)-(rowSize-1);
		int end = rowSize*page;
		
		map.put("id", id);
		map.put("start", start);
		map.put("end", end);
		
		List<JjimVO> list = dao.mp_recipeJjimList(map);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value = "recipe/mp_recipe_page.do", produces = "text/plain;charset=UTF-8")
	public String mp_recipe_page(int page, String id) throws Exception
	{
		int totalpage = dao.mp_recipeTotalpage(id);
		
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
	
	// 관리자 페이지
	@GetMapping(value = "recipe/ap_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String ap_recipe_list(int page) throws Exception
	{
		Map map = new HashMap();
		int rowSize = 12;
		int start = (rowSize*page)-(rowSize-1);
		int end = rowSize*page;
		
		map.put("start", start);
		map.put("end", end);
		
		List<RecipeVO> list = dao.ap_recipeListData(map);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value = "recipe/ap_totalpage_vue.do", produces = "text/plain;charset=UTF-8")
	public String ap_recipe_page(int page) throws Exception
	{
		int totalpage = dao.ap_recipeTotalPage();
		
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
	
	@GetMapping(value = "main/recipe_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String main_recipe_list() throws Exception
	{
		List<RecipeVO> list = dao.main_recipe_list();
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	@PostMapping(value = "recipe/recipe_del_vue.do", produces = "text/plain;charset=UTF-8")
	public void recipe_delete(int rno)
	{
		dao.RecipeDelete(rno);
	}
	
	@GetMapping(value= "recipe/comment_total_vue.do", produces = "text/plain;charset=UTF-8")
	public String comment_count(int rno) throws Exception
	{
		int total = dao.commentCount(rno);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(total);
		return json;
	}
	
	// 찜
	@GetMapping(value = "recipe/jjim_count_vue.do", produces = "text/plain;charset=UTF-8")
	public String jjim_count(int rno) throws Exception
	{
		int total = dao.recipeJjimCount(rno);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(total);
		return json;
	}
	
	@GetMapping(value = "recipe/jjim_ok_vue.do", produces = "text/plain;charset=UTF-8")
	public String jjim_Ok(int rno, String id) throws Exception
	{
		Map map = new HashMap();
		map.put("rno", rno);
		map.put("id", id);
		
		int jjimOk = dao.recipeJjim_ok(map);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(jjimOk);
		return json;
	}
	
	@PostMapping(value = "recipe/jjim_insert.do", produces = "text/plain;charset=UTF-8")
	public void jjim_insert(int rno, String id)
	{	
		Map map = new HashMap();
		map.put("rno", rno);
		map.put("id", id);
		
		dao.recipeJjimInsert(map);
		dao.recipeJjimIncrease(rno);
	}
	
	@PostMapping(value = "recipe/jjim_delete.do", produces = "text/plain;charset=UTF-8")
	public void jjim_delete(int rno, String id)
	{
		Map map = new HashMap();
		map.put("rno", rno);
		map.put("id", id);
		
		
		dao.reicpeJjimDelete(map);
		dao.recipeJjimDecrease(rno);
	}
	
}
