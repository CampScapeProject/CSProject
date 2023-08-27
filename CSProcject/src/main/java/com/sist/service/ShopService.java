package com.sist.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.BasketVO;
import com.sist.vo.MemberVO;
import com.sist.vo.OrderVO;
import com.sist.vo.ShopCategoryVO;
import com.sist.vo.ShopVO;

public interface ShopService {

	public List<ShopVO> shopAllList();
	
	public List<ShopCategoryVO> shopCateList();
	
	public ShopVO shopDetailList(int sno); 
	
	public int shopTotalPage(int cateno);
	
	public List<ShopVO> shopCateDetailList(Map map);
	
	public int shopRowCount();
	
	public void shopPay(OrderVO vo); 
	
	public void shopBasket(BasketVO vo);

	public List<BasketVO> basketList(String id);

	public void basketDelete(Map map);

	public List<ShopVO> basketDetail(String id);
	
    public List<ShopVO> shopRecomProduct(Map map);

	public void shopBasket_pay(int cno);
	
	public void deleteBasket(int cno);

	public List<OrderVO> orderList(String id);
	
	public void shopProductDelete(int sno);

	public void shopProductUpdate(ShopVO vo);
}
