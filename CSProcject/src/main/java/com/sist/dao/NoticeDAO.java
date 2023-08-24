package com.sist.dao;

import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {
	
	@Autowired
	private NoticeMapper mapper;
	
	public List<NoticeVO> noticeListData(Map map)
	{
		return mapper.noticeListData(map);
	}
	
	public int noticeTotalpage()
	{
		return mapper.noticeTotalpage();
	}
	
	public void noticeInsert(NoticeVO vo)
	{
		mapper.noticeInsert(vo);
	}
	
	public NoticeVO noticeDetailData(int nno)
	{
		mapper.noticeHitIncrease(nno);
		return mapper.noticeDetailData(nno);
	}
	
	public NoticeVO noticeUpdateData(int nno)
	{
		return mapper.noticeUpdateData(nno);
	}
	
	public void noticeUpdate(NoticeVO vo)
	{
		mapper.noticeUpdate(vo);
	}
	
	public void noticeDelete(int nno)
	{
		mapper.noticeDelete(nno);
	}
	
	public NoticeVO databoardFileInfoData(int nno)
	{
		return mapper.databoardFileInfoData(nno);
	}
	
}
