package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RentController {
	
	@GetMapping("rent/rent_main.do")
	public String rent_main() {
		return "rent/rent_main";
	}
	
	@GetMapping("rent/rent_detail.do")
	public String rent_detail(int rno, String date) {
		System.out.println(rno + " " + date);
		
		return "rent/rent_detail";
	}
}
