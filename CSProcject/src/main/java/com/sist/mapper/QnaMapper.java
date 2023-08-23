package com.sist.mapper;

import java.util.*;
import com.sist.vo.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface QnaMapper {
	
	//카테고리 상관없이 전체 리스트 출력
	@Select("SELECT qno, qcno, id, name, title, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, hit, open, group_tab, num "
			+ "FROM (SELECT qno, qcno, id, name, title, regdate , hit, open, group_tab, rownum as num "
			+ "FROM (SELECT qno, qcno, id, name, title, regdate , hit, open, group_tab "
			+ "FROM qna2 ORDER BY group_id DESC, group_step ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<QnaVO> qnaListData(Map map);
	
	//카테고리별 리스트 출력
	public List<QnaVO> qnaCategoryListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM qna2")
	public int qnaTotalpage();
	
	// 글 작성
	@Insert("INSERT into qna2(qno, qcno, id, name, title, content, open, group_id, regdate) "
			+ "VALUES(qna2_qno_seq.nextval, #{qcno}, #{id}, #{name}, #{title}, #{content}, #{open}, "
			+ "(SELECT NVL(MAX(group_id)+1, 1) FROM qna2), SYSDATE)")
	public void qnaInsert(QnaVO vo);
	
	// 상세 보기
	@Update("UPDATE qna2 SET hit=hit+1 WHERE qno=#{qno}")
	public void hitIncrement(int qno);
	
	@Select("SELECT qno, id, title, content, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, hit FROM qna2 WHERE qno=#{qno}")
	public QnaVO qnaDetailData(int qno);

	// 답글
	@Select("SELECT group_id, group_step, group_tab FROM qna2 WHERE qno=#{qno}")
	public QnaVO qnaParentInfo(int qno);
	
	@Update("UPDATE qna2 SET group_step=group_step+1 WHERE group_id=#{group_id} AND group_step>#{group_step}")
	public void qnaGroupStepIncrement(QnaVO vo);
	
	@Insert("INSERT INTO qna2(qno, id, name, title, content, group_id, group_step, group_tab, root) "
			+ "VALUES(qna2_qno_seq.nextval, #{id}, #{name}, #{title}, #{content}, #{group_id}, #{group_step}, #{group_tab}, #{root})")
	public void qnaReplyInsert(QnaVO vo);
	
	@Update("UPDATE qna2 SET depth=depth+1 WHERE qno=#{qno}")
	public void qnaDepthIncrement(int qno);

	// 수정
	@Update("UPDATE qna2 SET title=#{title}, content=#{content} WHERE qno=#{qno}")
	public void qnaUpdate(QnaVO vo);
	
	// 삭제
	@Select("SELECT root, depth FROM qna2 WHERE qno=#{qno}")
	public QnaVO qnaInfoData(int qno);
	
	@Update("UPDATE qna2 SET title='관리자가 삭제한 게시물입니다.', content='관리자가 삭제한 게시물입니다.', open='y' WHERE qno=#{qno}")
	public void qnaTitleUpdate(int qno);
	
	@Delete("DELETE FROM qna2 WHERE qno=#{qno}")
	public void qnaDelete(int qno);
	
	@Update("UPDATE qna2 SET depth=depth-1 WHERE qno=#{qno}")
	public void qnaDepthDecrement(int qno);
	
	
}
