package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sist.dao.ShopDAO;
import com.sist.vo.BasketVO;
import com.sist.vo.MemberVO;
import com.sist.vo.OrderVO;
import com.sist.vo.ShopCategoryVO;
import com.sist.vo.ShopVO;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopDAO dao;
	
	@Override
	public List<ShopVO> shopAllList() {
		return dao.shopAllList();
	}

	@Override
	public List<ShopCategoryVO> shopCateList() {
		return dao.shopCateList();
	}

	@Override
	public List<ShopVO> shopCateDetailList(Map map) {
		return dao.shopCateDetailList(map);
	}

	@Override
	public ShopVO shopDetailList(int sno) {
		return dao.shopDetailList(sno);
	}

	@Override
	public int shopTotalPage(int cateno) {
		return dao.shopTotalPage(cateno);
	}

	@Override
	public int shopRowCount() {
		return dao.shopRowCount();
	}

	@Override
	public void shopPay(OrderVO vo) {
		dao.shopPay(vo);
	}

	@Override
	public void shopBasket(BasketVO vo) {
		dao.shopBasket(vo);
		
	}

	@Override
	public List<BasketVO> basketList(String id) {
		return dao.basketList(id);
	}

	@Override
	public void basketDelete(Map map) {
		dao.basketDelete(map);		
	}

	@Override
	public List<ShopVO> basketDetail(String id) {
		return dao.basketDetail(id);
	}

	@Override
	public List<ShopVO> shopRecomProduct(Map map) {
		return dao.shopRecomProduct(map);
	}

	
}
