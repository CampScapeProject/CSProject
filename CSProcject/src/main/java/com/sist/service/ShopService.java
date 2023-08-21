package com.sist.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.ShopCategoryVO;
import com.sist.vo.ShopVO;

public interface ShopService {

	public List<ShopCategoryVO> shopCateList();
	
	public ShopVO shopDetailList(int sno);
	
	public int shopTotalPage(int cno);
	
	public List<ShopVO> shopCateDetailList(Map map);
	
	public int shopRowCount();
	
	public void shopPay(Map map); 
}
