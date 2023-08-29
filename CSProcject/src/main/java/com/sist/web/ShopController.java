package com.sist.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public String shop_detail(int sno,Model model,HttpServletResponse response, HttpServletRequest request) {
		
		model.addAttribute("sno", sno);
		
		Cookie[] cookies=request.getCookies();
		if(cookies!=null) {
			for(int i=cookies.length-1;i>=0;i--) {
				String key=cookies[i].getName();
				if(key.equals("shop_"+sno)) {
					cookies[i].setMaxAge(0); // 쿠키를 삭제하기 위해 만료시간을 0으로 설정
	                cookies[i].setPath("/");
	                response.addCookie(cookies[i]);
				}
			}
		}
		
		Cookie cookie=new Cookie("shop_"+sno, String.valueOf(sno));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
		return "shop/shop_detail";
	}
	

	@RequestMapping("shop/shop_pay.do")
	public String shop_pay_order(OrderVO vo,Model model) {

		model.addAttribute("sno",vo.getSno());
		model.addAttribute("amount", vo.getAmount());
		model.addAttribute("id", vo.getId());
		model.addAttribute("price", vo.getPrice());
		
		if(vo.getCno()!=0) {
			model.addAttribute("cno", vo.getCno());
		}

		
	    return "shop/shop_pay";
	}


	
}
