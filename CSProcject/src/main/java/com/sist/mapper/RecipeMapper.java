package com.sist.mapper;

import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.annotations.Select;

public interface RecipeMapper {
	
	@Select("SELECT tno, title, image, msg2, jjim, recommend, num "
			+ "FROM (SELECT tno, title, image, msg2, jjim, recommend, rownum as num "
			+ "FROM (SELECT tno, title, image, msg2, jjim, recommend FROM recipe2 ORDER BY tno DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<recipeVO> recipeListData(Map map);
	
}
