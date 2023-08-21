package com.sist.mapper;

import java.util.*;
import com.sist.vo.*;
import org.apache.ibatis.annotations.Select;

public interface QnaMapper {
	
	@Select("SELECT qno, qcno, id, name, title, regdate as dbday, hit, open, num "
			+ "FROM (SELECT qno, qcno, id, name, title, regdate as dbday, hit, open, rownum as num "
			+ "FROM (SELECT qno, qcno, id, name, title, regdate as dbday, hit, open "
			+ "FROM qna2 ORDER BY qno DESC) "
			+ "WHERE num BETWEEN #{start} AND {#end}")
	public List<QnaVO> qnaListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/15.0) FROM qna2")
	public int qnaTotalpage();
}
