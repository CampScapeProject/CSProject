package com.sist.mapper;
 
import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.CampSiteVO;
import com.sist.vo.CampVO;
import com.sist.vo.JjimVO;
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
	
	public int campFindTotal(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM camp2")
	public int campTotalPage();
	
	@Select("SELECT CEIL(COUNT(*)/4.0) FROM camp2")
	public int campTotalMainPage();
	
	@Update("UPDATE camp2 SET hit=hit+1 WHERE cno=#{cno} ")
	public void campHitUpdate(int cno);
	
	@Select("SELECT camp2.cno,name,address,phone,msg,image,hit,(SELECT MIN(TO_NUMBER(price)) FROM campsite2  WHERE campsite2.cno=camp2.cno) as mprice FROM camp2 WHERE camp2.cno=#{cno}")
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
	
	@Insert("INSERT INTO review2(no,regdate,content,subject,sno,type,id,img) "
			+ "VALUES(rv2_no_seq.nextval,SYSDATE,#{content},#{subject},#{sno},'c',#{id},#{image})")
	public void campReviewInsert(ReviewVO vo);
	
	@Update("UPDATE review2 SET subject=#{sub},content=#{cont} WHERE no=#{no}")
	public void campReviewUpdate(Map map);
	
	@Update("UPDATE review2 SET hit=hit+1 WHERE no=#{no}")
	public void campReviewHitUpdate(int no);
	
	@Select("SELECT no,subject,content,sno,id,hit,TO_CHAR(regdate, 'YYYY-MM-DD') as dbday,img FROM review2 WHERE no=#{no}")
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
	@Select("SELECT rno,fno,name,email,price,rstate,inwon,TO_CHAR(sdate, 'YYYY-MM-DD') as dbsdate,TO_CHAR(edate, 'YYYY-MM-DD') as dbedate,(SELECT image FROM camp2 "
			+ "WHERE camp2.cno=reserve2.fno) as image,(SELECT name FROM campsite2 WHERE campsite2.csno=reserve2.csno) as campsite_name,"
			+ "(SELECT name FROM camp2 WHERE camp2.cno=reserve2.fno) as camp_name "
			+ "FROM reserve2 WHERE id=#{id} AND type='c' ORDER BY rno DESC")
	public List<ReserveVO> campMypageReserveList(String id);
	
	@Delete("DELETE FROM reserve2 WHERE rno=#{rno}")
	public void campMyReserveDelete(int rno);
	
	@Select("SELECT no,sno,content,TO_CHAR(regdate, 'YYYY-MM-DD') as dbday,"
			+ "(SELECT name FROM camp2 WHERE camp2.cno=review2.sno AND type='c') as camp_name,"
			+ "(SELECT image FROM camp2 WHERE camp2.cno=review2.sno AND type='c') as image,"
			+ "id,subject,hit FROM review2 WHERE id=#{id} AND type='c' ")
	public List<ReviewVO> mypageReiview(String id);
	
	//관리자 페이지

	public List<ReserveVO> campAdminReserveList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM reserve2 WHERE type='c'")
	public int campAdminTotalpage();
	
	@Update("UPDATE reserve2 SET rstate='예약승인' WHERE rno=#{rno}")
	public void rstateChange(int rno);
	
	@Select("SELECT msg,name FROM reserve2 WHERE type='c' AND rno=#{rno}")
	public ReserveVO adminReserveMsg(int rno);
	
	
	//찜하기
	@Insert("INSERT INTO jjim2 VALUES(j2_no_seq.nextval, #{id}, 'c', #{cno})")
	public void campJjimInsert(Map map);
	
	@Delete("DELETE FROM jjim2 WHERE id=#{id} AND type='c' AND sno=#{cno}")
	public void campJjimDelete(Map map);
	
	@Select("SELECT COUNT(*) FROM jjim2 WHERE type='c' AND id=#{id} AND sno=#{cno} ")
	public int campJjimCount(Map map);
	
	@Select("SELECT no,id,sno,(SELECT name FROM camp2 WHERE camp2.cno=jjim2.sno) as name, (SELECT address FROM camp2 WHERE camp2.cno=jjim2.sno) as address,"
			+ "(SELECT phone FROM camp2 WHERE camp2.cno=jjim2.sno) as phone,"
			+ "(SELECT MIN(TO_NUMBER(price)) FROM campsite2 WHERE campsite2.cno=jjim2.sno) as price,"
			+ "(SELECT image FROM camp2 WHERE camp2.cno=jjim2.sno) as image "
			+ "FROM jjim2 WHERE id=#{id} AND type='c'")
	public List<JjimVO> campJjimList(String id);
	
	
	
	//메일
	
	@Select("SELECT rno,fno,name,email,price,rstate,inwon,TO_CHAR(sdate, 'YYYY-MM-DD') as dbsdate,TO_CHAR(edate, 'YYYY-MM-DD') as dbedate,(SELECT image FROM camp2 "
			+ "WHERE camp2.cno=reserve2.fno) as image,(SELECT name FROM campsite2 WHERE campsite2.csno=reserve2.csno) as campsite_name,"
			+ "(SELECT name FROM camp2 WHERE camp2.cno=reserve2.fno) as camp_name "
			+ "FROM reserve2 WHERE rno=#{rno}")
	public ReserveVO campReserveMail(int rno);
	
	//추천
	
	 @Select("SELECT DISTINCT name FROM camp2 WHERE LENGTH(name)>1")
	   public List<String> campNamGetData();
	 
	  @Select("SELECT cno,name,image,msg,rownum FROM camp2 "
			  +"WHERE name=#{name} AND rownum<=1")
	   public CampVO campRecommandInfoData(String name);
	  
	  
}
