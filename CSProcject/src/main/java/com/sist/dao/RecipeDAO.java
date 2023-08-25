package com.sist.dao;

import com.sist.vo.*;
import com.sist.mapper.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
	
	// 관리자 페이지
	public List<RecipeVO> ap_recipeListData(Map map)
	{
		return mapper.ap_recipeListData(map);
	}
}
