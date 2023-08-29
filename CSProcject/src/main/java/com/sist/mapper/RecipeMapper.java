package com.sist.mapper;

import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface RecipeMapper {
	
	public List<RecipeVO> recipeListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM recipe2 WHERE title LIKE '%'||#{fd}||'%'")
	public int recipeTotalPage(String fd);
	
	@Update("UPDATE recipe2 SET hit=hit+1 WHERE rno=#{rno}")
	public void recipeHitIncrease(int rno);
	
	@Select("SELECT rno, title, image, msg1, msg2, ingre, allsteps, allstepsimg, jjim, hit FROM recipe2 WHERE rno=#{rno}")
	public RecipeVO recipeDetailData(int rno);
	
	// 댓글
	@Select("SELECT cmno, rno, id, nickname, msg, TO_CHAR(regdate, 'YYYY\"년\" MM\"월\" DD\"일\" hh24:mi') as dbday FROM comment2 WHERE rno=#{rno}")
	public List<CommentVO> CommentListData(int rno);
	
	@Insert("INSERT INTO comment2 VALUES(cm2_cmno_seq.nextval, #{rno}, #{id}, #{nickname}, #{msg}, SYSDATE)")
	public void CommentInsert(CommentVO vo);
	
	@Update("UPDATE comment2 SET msg=#{msg} WHERE cmno=#{cmno}")
	public void CommentUpdate(CommentVO vo);
	
	@Delete("DELETE FROM comment2 WHERE cmno=#{cmno}")
	public void CommentDelete(int cmno);
	
	// 마이 페이지
	@Select("SELECT no, id, sno, rownum, (SELECT title FROM recipe2 WHERE recipe2.rno = jjim2.sno) as name, "
			+ "(SELECT image FROM recipe2 WHERE recipe2.rno = jjim2.sno) as image, "
			+ "(SELECT jjim FROM recipe2 WHERE recipe2.rno = jjim2.sno) as jjim "
			+ "FROM jjim2 WHERE id=#{id} AND type='p' AND rownum BETWEEN #{start} AND #{end} ")
	public List<JjimVO> mp_recipeJjimList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM jjim2 WHERE id=#{id} AND type='p'")
	public int mp_recipeTotalpage(String id);
	
	// 관리자 페이지
	@Select("SELECT rno, title, image, jjim, hit, num "
			+ "FROM (SELECT rno, title, image, jjim, hit, rownum as num "
			+ "FROM (SELECT rno, title, image, jjim, hit FROM recipe2 ORDER BY rno ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<RecipeVO> ap_recipeListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM recipe2")
	public int ap_recipeTotalPage();
	
	@Select("SELECT rno, title, hit FROM recipe2 ORDER BY hit DESC")
	public List<RecipeVO> main_recipe_list();
	
	@Delete("DELETE FROM recipe2 WHERE rno=#{rno}")
	public void RecipeDelete(int rno);
	
	@Select("SELECT COUNT(*) FROM comment2 WHERE rno=#{rno}")
	public int commentCount(int rno);
	
	// 찜 
	@Insert("INSERT INTO jjim2 (no, id, type, sno) VALUES(j2_no_seq.nextval, #{id}, 'p', #{rno})")
	public void recipeJjimInsert(Map map);
	
	@Delete("DELETE FROM jjim2 WHERE id=#{id} AND type='p' AND sno=#{rno}")
	public void reicpeJjimDelete(Map map);
	
	@Select("SELECT COUNT(*) FROM jjim2 WHERE type='p' AND sno=#{rno}")
	public int recipeJjimCount(int rno);
	
	// 찜 확인용
	@Select("SELECT COUNT(*) FROM jjim2 WHERE type='p' AND sno=#{rno} AND id=#{id}")
	public int recipeJjim_ok(Map map);
	
	@Update("UPDATE recipe2 SET jjim=jjim+1 WHERE rno=#{rno}")
	public void recipeJjimIncrease(int rno);
	
	@Update("UPDATE recipe2 SET jjim=jjim-1 WHERE rno=#{rno}")
	public void recipeJjimDecrease(int rno);
}
