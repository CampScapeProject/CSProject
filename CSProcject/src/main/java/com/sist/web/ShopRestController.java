package com.sist.web;

import java.io.File;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.output.CloseShieldOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.transaction.AfterTransaction;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.ShopService;
import com.sist.vo.BasketVO;
import com.sist.vo.CampVO;
import com.sist.vo.OrderVO;
import com.sist.vo.PageVO;
import com.sist.vo.ShopCategoryVO;
import com.sist.vo.ShopVO;

@RestController
public class ShopRestController {

	@Autowired
	private ShopService service;

	// 메인 상품리스트 출력
	@GetMapping(value = "main/shopList_vue.do", produces = "text/plain;charset=UTF8")
	public String main_shopList() throws Exception {

		List<ShopVO> shopList = service.shopAllList();

		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(shopList);

		return json;

	}

	@GetMapping(value = "shop/shop_cateList_vue.do", produces = "text/plain;charset=UTF8")
	public String shop_cateList() throws Exception {

		List<ShopCategoryVO> list = service.shopCateList();

		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);

		return json;

	}

	@GetMapping(value = "shop/shop_cateAllList_vue.do", produces = "text/plain;charset=UTF8")
	public String shop_cateAllList(int cateno, int page, String fd) throws Exception {

		Map map = new HashMap();

		// 1페이지에 12개 출력 (start:index 1 / end:index 12)
		int rowSize = 12;
		int start = (rowSize * page) - (rowSize - 1);
		int end = rowSize * page;

		map.put("cateno", cateno);
		map.put("start", start);
		map.put("end", end);
		map.put("fd", fd);

		List<ShopVO> list = service.shopCateDetailList(map);

		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);

		return json;

	}

	@GetMapping(value = "shop/page_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String page_list(String fd, int page, int cateno) throws Exception {

		Map map = new HashMap();

		map.put("fd", fd);
		map.put("cateno", cateno);

		int totalpage = service.shopTotalPage(map);

		// 시작페이지~끝페이지 1~10
		final int BLOCK = 10;
		int startpage = ((page - 1) / BLOCK * BLOCK) + 1;
		int endpage = ((page - 1) / BLOCK * BLOCK) + BLOCK;

		if (endpage > totalpage)
			endpage = totalpage;

		PageVO vo = new PageVO();
		vo.setTotalpage(totalpage);
		vo.setCurpage(page);
		vo.setStartpage(startpage);
		vo.setEndpage(endpage);

		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);

		return json;
	}

	@GetMapping(value = "shop/shop_detail_vue.do", produces = "text/plain;charset=UTF8")
	public String shop_detail(int sno) throws Exception {

		ShopVO vo = service.shopDetailList(sno);

		String image = vo.getDetail_image();
		String[] imageUrls = image.split("\\^");

		Map<String, Object> result = new HashMap<>();
		result.put("shopDetail", vo);
		result.put("imageUrls", imageUrls);

		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(result);

		return json;

	}

	@GetMapping(value = "shop/shop_pay_vue.do", produces = "text/plain;charset=UTF8")
	public String shop_pay(int sno) throws Exception {

		ShopVO vo = service.shopDetailList(sno);

		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);

		return json;

	}

	@GetMapping(value = "shop/shop_basketInsert_vue.do", produces = "text/plain;charset=UTF8")
	public String basketInsert(BasketVO vo) {

		service.shopBasket(vo);
		return "ok";
	}

	@GetMapping(value = "mypage/basket_delete_vue.do", produces = "text/plain;charset=UTF8")
	public String basket_delete(String id, int cno) {

		Map map = new HashMap();

		map.put("id", id);
		map.put("cno", cno);

		service.basketDelete(map);

		return "ok";

	}

	@GetMapping(value = "mypage/basket_detail_vue.do", produces = "text/plain;charset=UTF8")
	public String basket_detail(String id) throws Exception {

		List<ShopVO> list = service.basketDetail(id);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);

		return json;

	}

	@GetMapping(value = "shop/shop_recom_vue.do", produces = "text/plain;charset=UTF8")
	public String shopRecom(int start, int end, int sno) throws Exception {

		Map recom = new HashMap();
		recom.put("start", start);
		recom.put("end", end);
		List<ShopVO> recomDetail = service.shopRecomProduct(recom);

		Map result = new HashMap<>();
		result.put("recomDetail", recomDetail);

		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(result);

		return json;

	}

	@PostMapping(value = "shop/shop_pay_ok.do", produces = "text/plain;charset=UTF8")
	public String shop_pay_ok(OrderVO vo) {

		if (vo.getCno() == 0) {
			service.shopPay(vo);
		} else {
			service.shopPay(vo);
			service.deleteBasket(vo.getCno());
		}

		return "ok";
	}

	@GetMapping(value = "shop/shop_basket_buy_vue.do", produces = "text/plain;charset=UTF8")
	public String shop_basket_buy(int cno) {

		service.shopBasket_pay(cno);

		return "ok";
	}

	@GetMapping(value = "mypage/order_detail_vue.do", produces = "text/plain;charset=UTF8")
	public String mypage_orderList(String id) throws Exception {

		List<OrderVO> list = service.orderList(id);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);

		return json;

	}

	@Transactional
	@GetMapping(value = "adminpage/product_delete_vue.do", produces = "text/plain;charset=UTF8")
	public String shop_product_delete(int sno) {

		service.shopProductDelete(sno);

		return "ok";
	}

	@GetMapping(value = "adminpage/find_product_vue.do", produces = "text/plain;charset=UTF8")
	public String shop_product_find(String fd) {

		return "ok";
	}

	@PostMapping(value = "adminpage/product_update_vue.do", produces = "text/plain;charset=UTF8")
	public String shop_product_update(ShopVO vo) {

		service.shopProductUpdate(vo);
		return "ok";
	}

	@GetMapping(value = "shop/shop_cookie.do", produces = "text/plain;charset=UTF-8")
	public String shopCookieData(HttpServletRequest request) throws Exception {

		Cookie[] cookies = request.getCookies();

		List<ShopVO> clist = new ArrayList<ShopVO>();
		if (cookies != null) {
			for (int i = cookies.length - 1; i >= 0; i--) {
				String key = cookies[i].getName();
				if (key.startsWith("shop_")) {
					String data = cookies[i].getValue();
					ShopVO vo = new ShopVO();
					vo = service.shopDetailList(Integer.parseInt(data));
					String name = vo.getName();
					if (name.length() > 7) {
						vo.setName(name.substring(0, 7) + "..");
					}
					clist.add(vo);
				}
			}
		}
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(clist);
	}

	@GetMapping(value = "adminpage/shop_updateDetail_vue.do", produces = "text/plain;charset=UTF-8")
	public String adminpage_shopDetail(int sno) throws Exception {

		ShopVO vo = service.shopDetailList(sno);

		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);

		return json;

	}

	@PostMapping(value = "product_update_vue.do", produces = "text/plain;charset=UTF-8")
	public String adminpage_productUpdate(ShopVO vo, MultipartFile imagefile, HttpServletRequest request) {

		
		if(imagefile!=null) {
			String path = request.getSession().getServletContext().getRealPath("/")+"layout\\upload-rent\\"+imagefile.getOriginalFilename();
			path=path.replace("\\", File.separator); // os에 따른 경로 구분자 변경
			
			System.out.println(path);
			
			try {
				imagefile.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}
			vo.setImage("../layout/upload-rent/"+imagefile.getOriginalFilename());
		}	
		System.out.println(vo.getImage());
		service.shopProductUpdate(vo);
		return "ok";
	}

}
