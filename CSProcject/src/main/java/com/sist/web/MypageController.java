package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
	
	@GetMapping("mypage/main.do")
	public String mypage_main(){
		return "mypage/member";
	}
	
	@GetMapping("mypage/camp_reserve.do")
	public String mypage_camp_reserve(){
		return "mypage/camp_reserve";
	}
	
	@GetMapping("mypage/camp_review.do")
	public String mypage_camp_review(){
		return "mypage/camp_review";
	}
	
	@GetMapping("mypage/rent_reserve.do")
	public String mypage_rent_reserve(){
		return "mypage/rent_reserve";
	}
	
	@GetMapping("mypage/rent_review.do")
	public String mypage_rent_review(){
		return "mypage/rent_review";
	}
	
	@GetMapping("mypage/shop_order.do")
	public String mypage_shop_order(){
		return "mypage/shop_order";
	}
	
	@GetMapping("mypage/shop_basket.do")
	public String mypage_shop_basket(){
		return "mypage/shop_basket";
	}
	
	@GetMapping("mypage/recipe.do")
	public String mypage_recipe(){
		return "mypage/recipe";
	}
	
	@GetMapping("mypage/qna.do")
	public String mypage_qna(){
		return "mypage/qna";
	}
	

	
}
