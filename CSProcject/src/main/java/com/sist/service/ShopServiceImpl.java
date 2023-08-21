package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sist.dao.ShopDAO;
import com.sist.vo.ShopCategoryVO;
import com.sist.vo.ShopVO;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopDAO dao;
	
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
	public int shopTotalPage(int cno) {
		return dao.shopTotalPage(cno);
	}

	@Override
	public int shopRowCount() {
		return dao.shopRowCount();
	}

	@Override
	public void shopPay(Map map) {
		dao.shopPay(map);
	}
	
	
	
}
