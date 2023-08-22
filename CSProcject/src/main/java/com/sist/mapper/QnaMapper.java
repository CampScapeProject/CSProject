package com.sist.mapper;

import java.util.*;
import com.sist.vo.*;
import org.apache.ibatis.annotations.Select;

public interface QnaMapper {
	
	//카테고리 상관없이 전체 리스트 출력
	@Select("SELECT qno, qcno, id, name, title, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, hit, open, num "
			+ "FROM (SELECT qno, qcno, id, name, title, regdate as dbday, hit, open, rownum as num "
			+ "FROM (SELECT qno, qcno, id, name, title, regdate as dbday, hit, open "
			+ "FROM qna2 ORDER BY qno DESC) "
			+ "WHERE num BETWEEN #{start} AND {#end}")
	public List<QnaVO> qnaListData(Map map);
	
	//카테고리별 리스트 출력
	public List<QnaVO> qnaCategoryListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/15.0) FROM qna2")
	public int qnaTotalpage();
	
	
}
