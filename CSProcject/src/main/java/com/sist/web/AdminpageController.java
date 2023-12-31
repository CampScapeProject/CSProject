package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminpageController {
	@GetMapping("adminpage/main.do")
	public String adminpage_main(){
		return "adminpage/member";
	}

	@GetMapping("adminpage/camp_reserve.do")
	public String adminpage_camp_reserve(){
		return "adminpage/camp_reserve";
	}

	@GetMapping("adminpage/camp_review.do")
	public String adminpage_camp_review(){
		return "adminpage/camp_review";
	}

	@GetMapping("adminpage/rent_reserve.do")
	public String adminpage_rent_reserve(){
		return "adminpage/rent_reserve"; 
	}

	@GetMapping("adminpage/rent_list.do")
	public String adminpage_rent_list(){
		return "adminpage/rent_list";
	}

	@GetMapping("adminpage/shop_order.do")
	public String adminpage_shop_order(){
		return "adminpage/shop_order";
	}

	@GetMapping("adminpage/shop_goods.do")
	public String adminpage_shop_goods(){
		return "adminpage/shop_goods";
	}

	@GetMapping("adminpage/recipe.do")
	public String adminpage_recipe(){
		return "adminpage/recipe";
	}

	@GetMapping("adminpage/qna.do")
	public String adminpage_qna(){
		return "adminpage/qna";
	}

	@GetMapping("adminpage/notice.do")
	public String adminpage_notice(){
		return "adminpage/notice";
	}
	
	@GetMapping("adminpage/shop_update.do")
	public String adminpage_shop_update(int sno,Model model){
		model.addAttribute("sno", sno);
		return "adminpage/shop_update";
	}
}
