package com.sist.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.CampMapper;
import com.sist.vo.CampSiteVO;
import com.sist.vo.CampVO;
import com.sist.vo.JjimVO;
import com.sist.vo.ReserveVO;
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
	
	public int campFindTotal(Map map)
	{
		return mapper.campFindTotal(map);
	}
	
	public int campTotalPage()
	{
		return mapper.campTotalPage();
	}
	
	public int campTotalMainPage()
	{
		return mapper.campTotalMainPage();
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
	public int campReviewCount(Map map)
	{
		return mapper.campReviewCount(map);
	}
	
	public void campReviewInsert(ReviewVO vo)
	{
		mapper.campReviewInsert(vo);
	}
	
	public ReviewVO campReviewDetail(int no)
	{
		mapper.campReviewHitUpdate(no);
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
	
	public CampSiteVO campSiteDetail(int csno)
	{
		return mapper.campSiteDetail(csno);  
	}
	
	public void campReserveInsert(ReserveVO vo)
	{
		mapper.campReserveInsert(vo);
	}
	
	//마이페이지
	public List<ReserveVO> campMypageReserveList(String id)
	{
		return mapper.campMypageReserveList(id);
	}
	
	public void campMyReserveDelete(int rno)
	{
		mapper.campMyReserveDelete(rno);
	}
	
	public List<JjimVO> campJjimList(String id)
	{
		return mapper.campJjimList(id);
	}
	
	public List<ReviewVO> mypageReiview(String id)
	{
		return mapper.mypageReiview(id);
	}
	
	//관리자페이지
	public List<ReserveVO> campAdminReserveList(Map map)
	{
		return mapper.campAdminReserveList(map);
	}
	
	public int campAdminTotalpage()
	{
		return mapper.campAdminTotalpage();
				
	}
	
	public void rstateChange(int rno)
	{
		mapper.rstateChange(rno);
	}
	
	public ReserveVO adminReserveMsg(int rno)
	{
		return mapper.adminReserveMsg(rno);
	}
	//찜하기
	
	public void campJjimInsert(Map map)
	{
		mapper.campJjimInsert(map);
	}
	
	public void campJjimDelete(Map map)
	{
		mapper.campJjimDelete(map);
	}
	
	public int campJjimCount(Map map)
	{
		return mapper.campJjimCount(map);
	}
	
	//메일
	public ReserveVO campReserveMail(int rno)
	{
		return mapper.campReserveMail(rno);
	}
	
	//추천
	public List<String> campNamGetData()
	{
		return mapper.campNamGetData();
	}
	
	public CampVO campRecommandInfoData(String name)
	{
		return mapper.campRecommandInfoData(name);
	}
}
