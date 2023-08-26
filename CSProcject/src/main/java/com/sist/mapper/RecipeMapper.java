package com.sist.mapper;

import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface RecipeMapper {
	
	@Select("SELECT rno, title, image, msg2, jjim, hit, num "
			+ "FROM (SELECT rno, title, image, msg2, jjim, hit, rownum as num "
			+ "FROM (SELECT rno, title, image, msg2, jjim, hit FROM recipe2 ORDER BY rno ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<RecipeVO> recipeListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM recipe2")
	public int recipeTotalPage();
	
	@Update("UPDATE recipe2 SET hit=hit+1 WHERE rno=#{rno}")
	public void recipeHitIncrease(int rno);
	
	@Select("SELECT rno, title, image, msg1, msg2, ingre, allsteps, allstepsimg, jjim, hit FROM recipe2 WHERE rno=#{rno}")
	public RecipeVO recipeDetailData(int rno);
	
	// 댓글
	@Select("SELECT cmno, rno, id, nickname, msg, TO_CHAT(regdate, 'YYYY\"년\" MM\"월\" DD\"일\" hh24:mi') as dbday FROM comment WHERE rno=#{rno}")
	public List<CommentVO> CommentListData(int rno);
	
	@Insert("INSERT INTO comment2 VALUES(cm2_cmno_seq.nextval, #{rno}, #{id}, #{nickname}, #{msg}, SYSDATE)")
	public void CommentInsert(CommentVO vo);
	
	@Update("UPDATE comment2 SET msg=#{msg} WHERE cmno=#{cmno}")
	public void CommentUpdate(CommentVO vo);
	
	@Delete("DELETE FROM comment2 WHERE cmno=#{cmno}")
	public void CommentDelete(int cmno);
	
	// 마이 페이지
	 
	// 관리자 페이지
	@Select("SELECT rno, title, image, jjim, hit, num "
			+ "FROM (SELECT rno, title, image, jjim, hit, rownum as num "
			+ "FROM (SELECT rno, title, image, jjim, hit FROM recipe2 ORDER BY rno ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<RecipeVO> ap_recipeListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM recipe2")
	public int ap_recipeTotalPage();
	
}
