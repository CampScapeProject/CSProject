package com.sist.dao;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.RentMapper;
import com.sist.vo.RentVO;
import com.sist.vo.ReviewVO;

@Repository
public class RentDAO {
	@Autowired
	private RentMapper mapper;
	
	public List<RentVO> rentListData(Map map){
		return mapper.rentListData(map);
	}
	
	public RentVO rentDetailData(int rno) {
		return mapper.rentDetailData(rno);
	}
	
	public RentVO rentCookieData(int rno) {
		return mapper.rentCookieData(rno);
	}
	
	public void jjimInsert(Map map) {
		mapper.jjimInsert(map);
	}
	
	public void jjimDelete(Map map) {
		mapper.jjimDelete(map);
	}
	
	public ReviewVO reviewTotalData(int rno) {
		return mapper.reviewTotalData(rno);
	}
}
