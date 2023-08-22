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
	
}
