package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.CampMapper;
import com.sist.vo.CampSiteVO;
import com.sist.vo.CampVO;
import com.sist.vo.ReviewVO;
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
	
	public CampVO campCookieData(int cno)
	{
		return mapper.campCookieData(cno);
	}
	
	public List<TourVO> tourListData(String addr)
	{
		return mapper.tourListData(addr);
	}
	
	public List<ReviewVO> campReviewList(Map map)
	{
		return mapper.campReviewList(map);
	}
	
	public int campReviewTotal(Map map)
	{
		return mapper.campReviewTotal(map);
	}
	public int campCount(Map map)
	{
		return mapper.campCount(map);
	}
	
	public void campReviewInsert()
	{
		mapper.campReviewInsert();
	}
	
	public ReviewVO campReviewDetail(int no)
	{
		mapper.campHitUpdate(no);
		return mapper.campReviewDetail(no);
	}
	
	public ReviewVO campUpdateData(int no)
	{
		return mapper.campReviewDetail(no);
	}
	
	public void campReviewUpdate(Map map)
	{
		mapper.campReviewUpdate(map);
	}
	
	public void campReviewDelete(int no)
	{
		mapper.campReviewDelete(no);
	}
	
	
	//예약
	
	public List<CampSiteVO> campSiteList(int cno)
	{
		return mapper.campSiteList(cno);
	}
}
