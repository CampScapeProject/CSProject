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
	
	public List<recipeVO> recipeListData(Map map)
	{
		return mapper.recipeListData(map);
	}
	
}
