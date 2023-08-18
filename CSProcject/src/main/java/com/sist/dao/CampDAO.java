package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.CampMapper;
import com.sist.vo.CampVO;

@Repository
public class CampDAO {
	
	@Autowired
	private CampMapper mapper;
	public List<CampVO> campListData(Map map)
	{
		return mapper.campListData(map);
	}
	
	public List<CampVO> campFindData(Map map)
	{
		return mapper.campFindData(map);
	}
	
	public int campTotalPage()
	{
		return mapper.campTotalPage();
	}
}
