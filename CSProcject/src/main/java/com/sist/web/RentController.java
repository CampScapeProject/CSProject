package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RentController {
	
	@GetMapping("rent/rent_main.do")
	public String rent_main() {
		return "rent/rent_main";
	}
}
