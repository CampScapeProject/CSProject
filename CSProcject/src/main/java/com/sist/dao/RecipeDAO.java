package com.sist.dao;

import com.sist.vo.*;
import com.sist.mapper.*;
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
}
