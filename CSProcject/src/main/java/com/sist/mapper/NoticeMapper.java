package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface NoticeMapper {
	
	@Select("SELECT no, title, TO_CHAR(regdate,'YYYY-MM-DD') as dbday, hit, num "
			+ "FROM (SELECT /*+ INDEX_DESC(notice2 ntc_nno_pk)*/no, title, regdate, hit, rownum as num "
			+ "FROM (SELECT no, title, regdate, hit FROM notice2)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<NoticeVO> noticeListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/15.0) FROM notice2")
	public int noticeTotalpage();
}
