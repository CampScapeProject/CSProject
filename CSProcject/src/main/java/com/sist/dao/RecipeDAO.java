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
	
	public int recipeTotalPage()
	{
		return mapper.recipeTotalPage();
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
	public List<JjimVO> mp_recipeJjimList(String id)
	{
		return mapper.mp_recipeJjimList(id);
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
	public void recipeJjimInsert(String id, int rno)
	{
		mapper.recipeJjimIncrease(rno);
		mapper.recipeJjimInsert(id, rno);
	}
	
	public void reicpeJjimDelete(String id, int rno)
	{
		mapper.recipeJjimDecrease(rno);
		mapper.reicpeJjimDelete(id, rno);
	}
	
	public int recipeJjimCount(int rno)
	{
		return mapper.recipeJjimCount(rno);
	}
	
	public int recipeJjim_ok(int rno, String id)
	{
		return mapper.recipeJjim_ok(rno, id);
	}
}
