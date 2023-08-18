package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.RentMapper;
import com.sist.vo.RentVO;

@Repository
public class RentDAO {
	@Autowired
	private RentMapper mapper;
	
	public List<RentVO> rentListData(Map map){
		return mapper.rentListData(map);
	}
}
