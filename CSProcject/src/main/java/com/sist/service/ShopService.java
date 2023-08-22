package com.sist.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.BasketVO;
import com.sist.vo.OrderVO;
import com.sist.vo.ShopCategoryVO;
import com.sist.vo.ShopVO;

public interface ShopService {

	public List<ShopVO> shopAllList();
	
	public List<ShopCategoryVO> shopCateList();
	
	public ShopVO shopDetailList(int sno);
	
	public int shopTotalPage(int cno);
	
	public List<ShopVO> shopCateDetailList(Map map);
	
	public int shopRowCount();
	
	public void shopPay(OrderVO vo); 
	
	public void shopBasket(BasketVO vo);

	public List<BasketVO> basketList(String id);

	public void basketDelete(Map map);

}
