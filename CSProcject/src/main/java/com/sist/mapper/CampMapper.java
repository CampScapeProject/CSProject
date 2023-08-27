package com.sist.mapper;
 
import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.CampSiteVO;
import com.sist.vo.CampVO;
import com.sist.vo.RentVO;
import com.sist.vo.ReserveVO;
import com.sist.vo.ReviewVO;
import com.sist.vo.TourVO;

import lombok.Delegate;

public interface CampMapper {
	
	@Select("SELECT cno,name,(SELECT MIN(TO_NUMBER(price)) FROM campsite2 cs WHERE cs.cno = c.cno) as mprice,image " 
			+"FROM camp2 c " 
			+"ORDER BY hit DESC " 
			+"FETCH FIRST 6 ROWS ONLY")
	public List<CampVO> campMainList();
	
	//<select id="campListData" resultType="CampVO" parameterType="hashmap">
	public List<CampVO> campListData(Map map); 
	
	//<select id="campFindData" resultType="CampVO" parameterType="hashmap">
	public List<CampVO> campFindData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM camp2")
	public int campTotalPage();
	
	@Update("UPDATE camp2 SET hit=hit+1 WHERE cno=#{cno} ")
	public void campHitUpdate(int cno);
	
	@Select("SELECT cno,name,address,phone,msg,image,(SELECT MIN(TO_NUMBER(price)) FROM campsite2 cs WHERE cs.cno=c.cno) as mprice FROM camp2 c WHERE cno=#{cno}")
	public CampVO campDetail(int cno);
	
	@Select("SELECT name FROM camp2 WHERE cno=#{cno}")
	public String campName(int cno);
	
	/*
	 * <select id="tourListData" resultType="CampVO" parameterType="hashmap"> SELECT
	 * tno,name,address,link,image,num FROM (SELECT
	 * tno,name,address,link,image,rownum as num FROM (SELECT
	 * tno,name,address,link,image FROM tour2 WHERE address LIKE '%'||#{addr}||'%'
	 * ORDER BY tno ASC)) WHERE num BETWEEN #{start} AND #{end} </select>
	 */
	
	@Select("SELECT cno,name,image,address FROM camp2 WHERE cno=#{cno}")
	public CampVO campCookieData(int cno);
	
	public List<TourVO> tourListData(String addr);
	
	/*
	 * <select id="campReviewList" resultType="TourVO" parameterType="hashmap">
		SELECT no,content,sno,type,id,TO_CHAT(regdate, 'YYYY-MM-DD'),num
		FROM (SELECT no,content,sno,type,id,regdate,rownum as num 
		FROM (SELECT no,content,sno,type,id,regdate FROM review2 WHERE sno=#{cno} AND type=#{type} ORDER BY no DESC))
		WHERE no BETWEEN #{start} AND #{end}
	</select>
	 */
	
	public List<ReviewVO> campReviewList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM review2 WHERE sno=#{cno} AND type=#{type}")
	public int campReviewTotal(Map map);
	
	@Select("SELECT COUNT(*) FROM review2 WHERE sno=#{cno} AND type=#{type}")
	public int campReviewCount(Map map);
	
	@Insert("INSERT INTO review2(no,regdate,content,sno,type,id) VALUES(rv2_no_seq.nextval,SYSDATE,#{msg},#{cno},'c',#{id})")
	public void campReviewInsert();
	
	@Update("UPDATE review2 SET subject=#{sub},content=#{cont} WHERE no=#{no}")
	public void campReviewUpdate(Map map);
	
	@Update("UPDATE review2 SET hit=hit+1 WHERE no=#{no}")
	public void campReviewHitUpdate(int no);
	
	@Select("SELECT no,subject,content,sno,id,hit,TO_CHAR(regdate, 'YYYY-MM-DD') as dbday FROM review2 WHERE no=#{no}")
	public ReviewVO campReviewDetail(int no);
	
	@Delete("DELETE FROM review2 WHERE no=#{no}")
	public void campReviewDelete(int no);
	
	
	//예약
	
	@Select("SELECT csno,cno,name,image,price,inwon FROM campsite2 WHERE cno=#{cno}")
	public List<CampSiteVO> campSiteList(int cno);  
	
	@Select("SELECT * FROM campsite2 WHERE csno=#{csno}")
	public CampSiteVO campSiteDetail(int csno);
	
	@Insert("INSERT INTO reserve2(rno,name,price,inwon,sdate,edate,type,fno,id,phone,email,msg,csno) "
			+ "VALUES(rs2_rno_seq.nextval,#{name},#{price},#{inwon},#{sdate},#{edate},'c',#{fno},#{id},#{phone},#{email},#{msg},#{csno})")
	public void campReserveInsert(ReserveVO vo);
	
	//마이페이지
	@Select("SELECT rno,fno,name,price,rstate,inwon,TO_CHAR(sdate, 'YYYY-MM-DD') as dbsdate,TO_CHAR(edate, 'YYYY-MM-DD') as dbedate,(SELECT image FROM camp2 "
			+ "WHERE camp2.cno=reserve2.fno) as image,(SELECT name FROM campsite2 WHERE campsite2.csno=reserve2.csno) as campsite_name,"
			+ "(SELECT name FROM camp2 WHERE camp2.cno=reserve2.fno) as camp_name "
			+ "FROM reserve2 WHERE id=#{id} AND type='c' ORDER BY rno DESC")
	public List<ReserveVO> campMypageReserveList(String id);
	
	@Delete("DELETE FROM reserve2 WHERE rno=#{rno}")
	public void campMyReserveDelete(int rno);
	
	//관리자 페이지

	public List<ReserveVO> campAdminReserveList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM reserve2 WHERE type='c'")
	public int campAdminTotalpage();
	
	@Update("UPDATE reserve2 SET rstate='예약승인' WHERE rno=#{rno}")
	public void rstateChange(int rno);
}
