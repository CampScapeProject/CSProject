package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Insert;

import com.sist.vo.*;

public interface NoticeMapper {
		@Insert("SELECT no, title, TO_CHAR(regdate,'YYYY-MM-DD') as dbday, hit, num "
				+ "FROM (SELECT /*+ INDEX_DESC(notice2 ntc_nno_pk)*/no, title, regdate, hit, rownum as num "
				+ "FROM (SELECT no, title, regdate, hit FROM notice2)) "
				+ "WHERE num BETWEEN #{start} AND #{end}")
		public List<NoticeVO> noticeListData(Map map);
}
