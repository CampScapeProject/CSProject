package com.sist.dao;

import com.sist.vo.*;
import com.sist.mapper.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeDAO {
	
	@Autowired
	private RecipeMapper mapper;
	
	public List<RecipeVO> recipeListData(Map map)
	{
		return mapper.recipeListData(map);
	}
	
	public int recipeTotalPage(String fd)
	{
		return mapper.recipeTotalPage(fd);
	}
	
	public RecipeVO recipeDetailData(int rno)
	{
		mapper.recipeHitIncrease(rno);
		return mapper.recipeDetailData(rno);
	}
	
	// 댓글
	public List<CommentVO> CommentListData(int rno)
	{
		return mapper.CommentListData(rno);
	}
	
	public void CommentInsert(CommentVO vo)
	{
		mapper.CommentInsert(vo);
	}
	
	public void CommentUpdate(CommentVO vo)
	{
		mapper.CommentUpdate(vo);
	}
	
	public void CommentDelete(int cmno)
	{
		mapper.CommentDelete(cmno);
	}
	
	// 마이 페이지
	public List<JjimVO> mp_recipeJjimList(Map map)
	{
		return mapper.mp_recipeJjimList(map);
	}
	
	public int mp_recipeTotalpage(String id)
	{
		return mapper.mp_recipeTotalpage(id);
	}
	
	// 관리자 페이지
	public List<RecipeVO> ap_recipeListData(Map map)
	{
		return mapper.ap_recipeListData(map);
	}
	
	public int ap_recipeTotalPage()
	{
		return mapper.ap_recipeTotalPage();
	}
	
	public List<RecipeVO> main_recipe_list()
	{
		return mapper.main_recipe_list();
	}
	
	public void RecipeDelete(int rno)
	{
		mapper.RecipeDelete(rno);
	}
	
	public int commentCount(int rno)
	{
		return mapper.commentCount(rno);
	}
	
	// 찜
	public void recipeJjimInsert(Map map)
	{
		mapper.recipeJjimInsert(map);
	}
	
	public void recipeJjimIncrease(int rno)
	{
		mapper.recipeJjimIncrease(rno);
	}
	
	public void reicpeJjimDelete(Map map)
	{
		mapper.reicpeJjimDelete(map);
	}
	
	public void recipeJjimDecrease(int rno)
	{
		mapper.recipeJjimDecrease(rno);
	}
	
	public int recipeJjimCount(int rno)
	{
		return mapper.recipeJjimCount(rno);
	}
	
	public int recipeJjim_ok(Map map)
	{
		return mapper.recipeJjim_ok(map);
	}
	
	
}
