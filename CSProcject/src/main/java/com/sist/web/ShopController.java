package com.sist.web;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.service.ShopService;
import com.sist.vo.OrderVO;

@Controller
public class ShopController {
	
	@Autowired
	private ShopService service;
	
	@GetMapping("shop/shop_main.do")
	public String shop_main() {

		return "shop/shop_main";
	}
	
	@GetMapping("shop/shop_detail.do")
	public String shop_detail(int sno,Model model) {
		
		model.addAttribute("sno", sno);
		
		return "shop/shop_detail";
	}
	
	@GetMapping("shop/shop_pay.do")
	public String shop_pay(OrderVO vo) {		
		
		return "shop/shop_pay";
	}	
	
//	@PostMapping("shop/shop_pay_ok.do")
//	public String shop_order(OrderVO vo) {
//		
//		service.shopPay(vo);
//		
//		return "redirect:../mypage/shop_order.do";
//	}

	@RequestMapping("shop/shop_pay_ok.do")
	public String shop_pay_order(String id,int sno,int price,int amount) {
	    // vo 객체에 전달된 데이터가 매핑됨
		
		OrderVO vo=new OrderVO();
		vo.setSno(sno);
		vo.setId(id);
		vo.setAmount(amount);
		vo.setPrice(price);

	    service.shopPay(vo);
	    
	    return "redirect:../mypage/shop_order.do";
	}

}
