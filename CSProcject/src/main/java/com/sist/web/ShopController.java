package com.sist.web;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ShopController {
	
	@GetMapping("shop/shop_main.do")
	public String shop_main() {

		return "shop/shop_main";
	}
	
	@GetMapping("shop/shop_detail.do")
	public String shop_detail(int sno,Model model) {
		
		model.addAttribute("sno", sno);
		
		return "shop/shop_detail";
	}
	
	@PostMapping("shop/shop_pay.do")
	public String shop_order(int sno,int price,int amount,Model model) {
		
		model.addAttribute("sno",sno);	
		model.addAttribute("price",price);	
		model.addAttribute("amount",amount);
		
		return "shop/shop_pay";
	}
	
	
	
}
