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
		  + "		(SELECT image FROM rent2 WHERE rent2.rno=reserve2.fno AND type='r') as image, "
		  + "		(SELECT car_name FROM rent2 WHERE rent2.rno=reserve2.fno AND type='r') as car_name,"
		  + "		(SELECT COUNT(*) FROM review2 WHERE reserve2.rno=review2.rsno AND type='r') as reviewok "
		  + "FROM reserve2 "
		  + "WHERE id=#{id} "
		  + "ORDER BY regdate DESC")
	public List<ReserveVO> reserveListData(String id);
	
	@Insert("INSERT INTO review2(no,regdate,content,sno,type,id,rating,rsno) "
		  + "VALUES(rv2_no_seq.nextval,SYSDATE,#{content},#{rno},'r',#{id},#{rank},#{rsno})")
	public void review_insert(Map map);
	
	@Update("UPDATE reserve2 SET rstate='취소 요청' WHERE rno=#{rno}")
	public void reserve_cancel_request(int rno);
	 
	@Update("UPDATE reserve2 SET rstate='대기' WHERE rno=#{rno}")
	public void reserve_request_cancel(int rno);
	
	@Select("SELECT no,content,sno,rating,dbday,car_name,image,num "
		  + "FROM (SELECT no,content,sno,rating,dbday,car_name,image,rownum as num "
		  + "	   FROM (SELECT no,content,sno,rating,TO_CHAR(regdate,'yyyy-mm-dd hh24:mi:ss') as dbday,"
		  + "					(SELECT car_name FROM rent2 WHERE rent2.rno=review2.sno) as car_name, "
		  + "					(SELECT image FROM rent2 WHERE rent2.rno=review2.sno) as image "
		  + "			 FROM review2 "
		  + "			 WHERE id=#{id}"
		  + "			 ORDER BY regdate DESC"
		  + "			 )"
		  + "	   ) "
		  + "WHERE num BETWEEN #{start} AND #{end}")
	public List<ReviewVO> rent_review_list(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/7.0) FROM review2 WHERE id=#{id}")
	public int reviewTotalPage(String id);
	
	//관리자페이지
	@Select("SELECT rno,image,car_name,car_type,maker,inwon,fuel,car_option,price,num "
		  + "FROM (SELECT rno,image,car_name,car_type,maker,inwon,fuel,car_option,price,rownum as num "
		  + "	   FROM (SELECT /*+INDEX_ASC(rent2 rt2_rno_pk)*/rno,image,car_name,car_type,maker,inwon,fuel,car_option,price "
		  + "  			 FROM rent2 "
		  + "			 WHERE car_name LIKE '%'||#{fd}||'%' "
		  + "			)"
		  + "	  ) "
		  + "WHERE num BETWEEN #{start} AND #{end}")
	public List<RentVO> adminRentListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/7.0) "
		  + "FROM rent2 "
		  + "WHERE car_name LIKE '%'||#{fd}||'%'")
	public int adminRentTotalpage(String fd);
	
	//렌터카 등록
	@Insert("INSERT INTO rent2 VALUES("
		  + "rt2_rno_seq.nextval, #{image},#{car_name},#{car_type},#{maker},#{inwon},#{fuel},#{car_option},#{price}"
		  + ")")
	public void insertRent(RentVO vo);
	
	//렌터카 업데이트
	@Update("UPDATE rent2 SET "
		  + "image=#{image}, car_name=#{car_name}, car_type=#{car_type}, maker=#{maker}, "
		  + "inwon=#{inwon}, fuel=#{fuel}, car_option=#{car_option}, price=#{price} "
		  + "WHERE rno=#{rno}")
	public void updateRent(RentVO vo);
}
