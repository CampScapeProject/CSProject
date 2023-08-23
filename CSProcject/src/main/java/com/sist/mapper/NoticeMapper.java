package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;

public interface NoticeMapper {
	
	@Select("SELECT nno, title, TO_CHAR(regdate,'YYYY-MM-DD') as dbday, fix, hit, num "
			+ "FROM (SELECT nno, title, regdate, fix, hit, rownum as num "
			+ "FROM (SELECT nno, title, regdate, fix, hit FROM notice2 ORDER BY fix DESC, nno DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<NoticeVO> noticeListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM notice2")
	public int noticeTotalpage();
	
	@Insert("INSERT INTO notice2 (nno, id, title, content, fix, regdate) VALUES(ntc2_nno_seq.nextval, #{id}, #{title}, #{content}, #{fix}, SYSDATE)")
	public void noticeInsert(NoticeVO vo);
	
	@Update("UPDATE notice2 SET hit=hit+1 WHERE nno=#{nno}")
	public void noticeHitIncrease(int nno);
	
	@Select("SELECT nno, title, content, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, hit FROM notice2 WHERE nno=#{nno}")
	public NoticeVO noticeDetailData(int nno);
}
