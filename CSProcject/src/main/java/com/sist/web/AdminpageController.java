package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminpageController {
	@GetMapping("adminpage/main.do")
	public String mypage_main(Model model){
		return "adminpage/content";
	}
}
