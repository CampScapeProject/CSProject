package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface NoticeMapper {
	
	@Select("SELECT nno, title, TO_CHAR(regdate,'YYYY-MM-DD') as dbday, hit, num "
			+ "FROM (SELECT nno, title, regdate, hit, rownum as num "
			+ "FROM (SELECT nno, title, regdate, hit FROM notice2 ORDER BY fix DESC, nno DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<NoticeVO> noticeListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/15.0) FROM notice2")
	public int noticeTotalpage();
}
