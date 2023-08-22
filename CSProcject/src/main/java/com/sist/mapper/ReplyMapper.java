package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.ReplyVO;

public interface ReplyMapper {
	
	@Select("SELECT COUNT(*) FROM reply2 WHERE rno=#{rno}")
	public int recipeReplyCount(int rno);
	
	@Select("SELECT id, nickname, msg, TO_CHAR(regdate, 'YYYY\"년\" MM\"월\" DD\"일\" hh24:mi:ss') as dbdy FROM reply2 WHERE rno=#{rno}")
	public List<ReplyVO> recipeReplyList(int rno);
	
	// 댓글 입력
	@Insert("INSERT INTO reply2 VALUES(rply_rpno_seq.nextval, #{rno}, #{id}, #{nickname}, #{msg}, SYSDATE)")
	public void recipeReplyInsert(ReplyVO vo);
	
	// 수정
	@Update("UPDATE reply2 SET msg=#{msg} WHERE rpno=#{rpno}")
	public void recipeReplyUpdate(ReplyVO vo);
	
	// 삭제
	@Delete("DELETE FROM reply2 WHERE rpno=#{rpno}")
	public void recipeReplyDelete(int rpno);
	
}
