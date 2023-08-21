package com.sist.rest;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.output.CloseShieldOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.ShopService;
import com.sist.vo.OrderVO;
import com.sist.vo.PageVO;
import com.sist.vo.ShopCategoryVO;
import com.sist.vo.ShopVO;

@RestController
public class ShopRestController {

	@Autowired
	private ShopService service;
	
	@GetMapping(value="shop/shop_cateList_vue.do",produces = "text/plain;charset=UTF8") 
	public String shop_cateList() throws Exception {
		
		List<ShopCategoryVO> list=service.shopCateList();
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		
		return json;
		
	}
	
	@GetMapping(value="shop/shop_cateAllList_vue.do",produces = "text/plain;charset=UTF8") 
	public String shop_cateAllList(int cno,int page) throws Exception {

		Map map=new HashMap();	
		
		// 1페이지에 12개 출력 (start:index 1 / end:index 12)
		int rowSize=12;
		int start=(rowSize*page)-(rowSize-1);
		int end=rowSize*page;
		
		map.put("cno", cno);
		map.put("start", start);
		map.put("end",end);
		List<ShopVO> list=service.shopCateDetailList(map);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		
		return json;
		
	}
	
	@GetMapping(value="shop/page_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String page_list(int page,int cno) throws Exception {
		
		int totalpage=service.shopTotalPage(cno);
		
		// 시작페이지~끝페이지 1~10
		final int BLOCK=10;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage)
			endPage=totalpage;
		
		PageVO vo=new PageVO();
		vo.setTotalpage(totalpage);
		vo.setCurpage(page);
		vo.setStartpage(startPage);
		vo.setEndpage(endPage);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		
		return json;
	}
	
	
	@GetMapping(value="shop/shop_detail_vue.do", produces = "text/plain;charset=UTF8")
	public String shop_detail(int sno) throws Exception {
		
		ShopVO vo=service.shopDetailList(sno);
		
	    String image = vo.getDetail_image();
	    String[] imageUrls = image.split("\\^");
		
	    Map<String, Object> result = new HashMap<>();
	    result.put("shopDetail", vo);
	    result.put("imageUrls", imageUrls);
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(result);
		
		return json;
		
	}
	
	@GetMapping(value="shop/shop_pay_vue.do", produces = "text/plain;charset=UTF8")
	public void shop_pay(int amount,int sno) {
		
		OrderVO vo=new OrderVO();	
		
		
	}

}
