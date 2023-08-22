package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.CampMapper;
import com.sist.vo.CampVO;
import com.sist.vo.TourVO;

@Repository
public class CampDAO {
	
	@Autowired
	private CampMapper mapper;
	
	public List<CampVO> campMainList()
	{
		return mapper.campMainList();
	}
	
	
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
	
	
	public CampVO campDetail(int cno)
	{
		mapper.campHitUpdate(cno);
		return mapper.campDetail(cno);
	}
	
	public String campName(int cno)
	{
		return mapper.campName(cno);
	}
	
	public List<TourVO> tourListData(String addr)
	{
		return mapper.tourListData(addr);
	}
}
