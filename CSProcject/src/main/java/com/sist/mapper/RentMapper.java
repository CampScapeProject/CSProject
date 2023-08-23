package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.*;
import com.sist.vo.*;

public interface RentMapper {
	public List<RentVO> rentListData(Map map);
	
	@Select("SELECT * FROM rent2 WHERE rno=#{rno}")
	public RentVO rentDetailData(int rno);
	
	@Select("SELECT rno,car_name,image FROM rent2 WHERE rno=#{rno}")
	public RentVO rentCookieData(int rno);
	
	@Insert("INSERT INTO jjim2 VALUES(j2_no_seq.nextval, #{id}, 'r', #{rno})")
	public void jjimInsert(Map map);
	
	@Delete("DELETE FROM jjim2 WHERE id=#{id} AND type='r' AND sno=#{rno}")
	public void jjimDelete(Map map);
	
	@Select("SELECT count(rating) as tCount, NVL(ROUND(AVG(rating),1),0) as tRating "
		  + "FROM review2 "
		  + "WHERE sno=#{rno}")
	public ReviewVO reviewTotalData(int rno);
	
	/*
	<select id="rentReviewList" resultType="ReviewVO" parameterType="hashmap">
		SELECT no,regdate,content,sno,type,id,rating,num 
		FROM (SELECT no,regdate,content,sno,type,id,rating,rownum as num 
			  FROM (SELECT no,regdate,content,sno,type,id,rating 
			  		FROM review2 
			  		WHERE type='r' 
			  		AND sno=#{rno} 
			  		ORDER BY regdate DESC
			  		)
			 )
		WHERE num BETWEEN #{start} AND #{end} 
	</select>
	 */
	public List<ReviewVO> rentReviewList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/5.0) "
		  + "FROM review2 "
		  + "WHERE type='r' "
		  + "AND sno=#{rno}")
	public int rentReviewTotalpage(int rno);
	
	@Select("SELECT id,pwd,email,name,nickname,sex,birth,phone,post,addr1,addr2,admin "
		  + "FROM member "
		  + "WHERE id=#{id}")
	public MemberVO memberInfoData(String id);
	
	@Insert("INSERT INTO reserve2(rno,name,birth,phone,email,price,id,fno,type,sdate,edate) "
		  + "VALUES(rs2_rno_seq.nextval,#{name},#{birth},#{phone},"
		  + "       #{email},#{price},#{id},#{fno},'r',#{sdate},#{edate})")
	public void rent_reserve_insert(ReserveVO vo);
	
	@Select("SELECT count(*) "
		  + "FROM reserve2 "
		  + "WHERE fno=#{rno} "
		  + "AND sdate BETWEEN #{sdate} AND #{edate} "
		  + "AND edate BETWEEN #{sdate} AND #{edate} "
		  + "AND type='r'")
	public int reserveCheck(Map map);
	
	//마이페이지
	@Select("SELECT rno,name,price,rstate,inwon,type,fno,id,phone,email,birth,"
		  + "		TO_CHAR(sdate,'yyyy-mm-dd') as dbsdate,TO_CHAR(edate,'yyyy-mm-dd') as dbedate,"
		  + "		TO_CHAR(regdate,'yyyy-mm-dd hh24:mi:ss') as dbdate,"
		  + "		(SELECT image FROM rent2 WHERE rent2.rno=reserve2.fno) as image "
		  + "FROM reserve2 "
		  + "WHERE id=#{id}")
	public List<ReserveVO> reserveListData(String id);
}
