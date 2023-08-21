package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import java.util.*;
import com.sist.vo.RentVO;

public interface RentMapper {
	public List<RentVO> rentListData(Map map);
	
	@Select("SELECT * FROM rent2 WHERE rno=#{rno}")
	public RentVO rentDetailData(int rno);
	
	@Select("SELECT rno,car_name,image FROM rent2 WHERE rno=#{rno}")
	public RentVO rentCookieData(int rno);
}
