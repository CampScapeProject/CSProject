package com.sist.mapper;

import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface RecipeMapper {
	
	@Select("SELECT rno, title, image, msg2, jjim, recommend, num "
			+ "FROM (SELECT rno, title, image, msg2, jjim, recommend, rownum as num "
			+ "FROM (SELECT rno, title, image, msg2, jjim, recommend FROM recipe2 ORDER BY rno ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<RecipeVO> recipeListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM recipe2")
	public int recipeTotalPage();
	
	@Update("UPDATE recipe2 SET hit=hit+1 WHERE rno=#{rno}")
	public void recipeHitIncrease(int rno);
	
	@Select("SELECT rno, title, image, msg1, msg2, ingre, allsteps, allstepsimg, jjim, recommend, hit FROM recipe2 WHERE rno=#{rno}")
	public RecipeVO recipeDetailData(int rno);
	
}
