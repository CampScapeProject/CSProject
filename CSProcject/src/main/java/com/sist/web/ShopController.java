package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShopController {
	@GetMapping("shop/shop_main.do")
	public String shop_main() {
		return "shop/shop_main";
	}
}
