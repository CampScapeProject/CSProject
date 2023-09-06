package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.*;
import com.sist.vo.*;



public interface RentMapper {
//	@Select({"<script>"
//		     + "SELECT rno, image, car_name, car_type, maker, inwon, fuel, car_option, price,	"
//		     + "(SELECT COUNT(*) FROM review2 WHERE sno=rno AND type='r') as rvCount,	"
//		     + "(SELECT NVL(ROUND(AVG(rating),1),0) FROM review2 WHERE sno=rno AND type='r') as rvAvg,	"
//		     + "(SELECT COUNT(*) FROM jjim2 WHERE sno=rno AND type='r') as jjimCount,	"
//		     + "(SELECT COUNT(*) FROM jjim2 WHERE sno=rno AND id=#{id} AND type='r') as jjimOk 		"
//		     + "FROM rent2	"
//		     + "WHERE (SELECT COUNT(sDate) FROM reserve2 WHERE rent2.rno=reserve2.fno "
//		     + "	   AND sDate BETWEEN #{sDate} AND #{eDate} AND type='r') = 0 	"
//		     + "	   AND (SELECT COUNT(eDate) FROM reserve2 WHERE rent2.rno=reserve2.fno "
//		     + "	   AND eDate BETWEEN #{sDate} AND #{eDate} AND type='r' ) = 0 	"
//		     + "	   <if test='!all'>	"
//		     + "		<trim prefix='AND (' suffix=')' suffixOverrides=' AND '>		"
//		     + "			<trim prefix='(' suffix=') AND ' prefixOverrides='OR'>			"
//		     + "				<if test='oArray.o1_1'>				"
//		     + "					OR car_type LIKE '%경차%'			"
//		     + "				</if>			"
//		     + "				<if test='oArray.o1_2'>				"
//		     + "					OR car_type LIKE '%소형차%'			"
//		     + "				</if>			"
//		     + "				<if test='oArray.o1_3'>				"
//		     + "					OR car_type LIKE '%준중형%'			"
//		     + "				</if>			"
//		     + "				<if test='oArray.o1_4'>				"
//		     + "					OR car_type LIKE '%중형%'			"
//		     + "				</if>			"
//		     + "				<if test='oArray.o1_5'>				"
//		     + "					OR car_type LIKE '%SUV%'			"
//		     + "				</if>			"
//		     + "				<if test='oArray.o1_6'>				"
//		     + "					OR car_type LIKE '%승합차%'			"
//		     + "				</if>			"
//		     + "				<if test='oArray.o1_7'>				"
//		     + "					OR car_type LIKE '%전기차%'			"
//		     + "				</if>			"
//		     + "				<if test='oArray.o1_8'>				"
//		     + "					OR car_type LIKE '%고급차%'			"
//		     + "				</if>			"
//		     + "				<if test='oArray.o1_9'>				"
//		     + "					OR car_type LIKE '%수입%'			"
//		     + "				</if>		"
//		     + "			</trim>				"
//		     + "			<trim prefix='(' suffix=') AND ' prefixOverrides='OR'>			"
//		     + "				<if test='oArray.o2_1'>				"
//		     + "					OR maker LIKE '%기아%'			"
//		     + "				</if>			"
//		     + "				<if test='oArray.o2_2'>				"
//		     + "					OR maker LIKE '%현대%'			"
//		     + "				</if>			"
//		     + "				<if test='oArray.o2_3'>				"
//		     + "					OR maker NOT LIKE '%기아%' AND maker NOT LIKE '%현대%'			"
//		     + "				</if>		"
//		     + "			</trim>				"
//		     + "			<trim prefix='(' suffix=') AND ' prefixOverrides='OR'>			"
//		     + "				<if test='oArray.o3_1'>				"
//		     + "					OR TO_NUMBER(inwon) &lt;= 5			"
//		     + "				</if>			"
//		     + "				<if test='oArray.o3_2'>				"
//		     + "					OR inwon IN ('6','7','8')			"
//		     + "				</if>			"
//		     + "				<if test='oArray.o3_3'>				"
//		     + "					OR TO_NUMBER(inwon) &gt; 8			"
//		     + "				</if>		"
//		     + "			</trim>				"
//		     + "			<trim prefix='(' suffix=') AND ' prefixOverrides='OR'>			"
//		     + "				<if test='oArray.o4_1'>				"
//		     + "					OR fuel IN('휘발유')			"
//		     + "				</if>			"
//		     + "				<if test='oArray.o4_2'>			"
//		     + "					OR fuel IN('경유')			"
//		     + "				</if>			"
//		     + "				<if test='oArray.o4_3'>				"
//		     + "					OR fuel NOT IN('휘발유','경유')			"
//		     + "				</if>		"
//		     + "			</trim>		 	"
//		     + "		</trim>	"
//		     + "	</if>	"
//		     + "ORDER BY rno ASC "
//		     + "</script>"})
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
		  + "AND type='r' "
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
		  + "			 WHERE id=#{id} "
		  + "			 AND type='r' "
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
	
	//관리자페이지 예약리스트
	public List<ReserveVO> adminReserveListData(Map map);
	
	//스케줄 - 예약상태변경
	@Update("UPDATE reserve2 "
		  + "SET rstate='이용완료' "
		  + "WHERE type='r' "
		  + "AND edate<SYSDATE "
		  + "AND rstate='예약승인' ")
	public void rstateUpdate();
	
	@Delete("DELETE FROM reserve2 "
		  + "WHERE rno=#{rsno}")
	public void reserveDelete(int rsno);
	
	@Update("UPDATE reserve2 "
		  + "SET rstate='예약승인' "
		  + "WHERE rno=#{rsno}")
	public void reserveOk(int rsno);
	
	@Select("SELECT rno,name,price,TO_CHAR(sdate,'yyyy-mm-dd') as dbsdate, "
		 + "	 	TO_CHAR(edate,'yyyy-mm-dd') as dbedate,email, "
		 + "		(SELECT car_name FROM rent2 WHERE rent2.rno=reserve2.fno) as car_name "
		 + "FROM reserve2 "
		 + "WHERE rno=#{rsno}")
	public ReserveVO reserveOkMailData(int rsno);
	
	@Select("SELECT rno,image,car_name,maker,jjimCount,rownum "
		  + "FROM (SELECT rno,image,car_name,maker,"
		  + "			  (SELECT COUNT(*) FROM jjim2 WHERE sno=rno AND type='r') as jjimCount "
		  + "      FROM rent2 "
		  + "      ORDER BY jjimCount desc "
		  + "	   ) "
		  + "WHERE rownum<=3")
	public List<RentVO> home_rent_list();
}
