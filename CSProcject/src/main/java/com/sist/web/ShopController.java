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
	

	@RequestMapping("shop/shop_pay.do")
	public String shop_pay_order(int sno,int amount,Model model) {

		model.addAttribute("sno", sno);
		model.addAttribute("amount", amount);
		

	    return "shop/shop_pay";
	}

	
}
