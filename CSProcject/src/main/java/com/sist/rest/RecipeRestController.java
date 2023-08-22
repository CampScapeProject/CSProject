package com.sist.rest;

import java.util.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;
import com.sist.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RecipeRestController {
	
	@Autowired
	private RecipeDAO dao;
	
	@GetMapping(value = "recipe/recipe_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String recipeList(int page) throws Exception
	{
		Map map = new HashMap();
		int rowSize = 12;
		int start = (rowSize*page)-(rowSize-1);
		int end = rowSize*page;
		
		map.put("start", start);
		map.put("end", end);
		
		List<RecipeVO> list = dao.recipeListData(map);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value = "recipe/recipe_page_vue.do", produces = "text/plain;charset=UTF-8")
	public String recipe_page(int page) throws Exception
	{
		int totalpage = dao.recipeTotalPage();
		
		final int BLOCK = 10;
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
}
