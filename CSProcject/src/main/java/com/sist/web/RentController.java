package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RentController {
	
	@GetMapping("rent/rent_main.do")
	public String rent_main() {
		return "rent/rent_main";
	}
	
	@GetMapping("rent/rent_detail.do")
	public String rent_detail(int rno, String date, Model model) {
		
		model.addAttribute("rno",rno);
		model.addAttribute("sDate",date.split(" - ")[0]);
		model.addAttribute("eDate",date.split(" - ")[1]);
		return "rent/rent_detail";
	}
	
	@GetMapping("rent/rent_payment.do")
	public String rent_payment(int rno, String sDate, String eDate,Model model) {

		model.addAttribute("rno",rno);
		model.addAttribute("sDate",sDate);
		model.addAttribute("eDate",eDate);
		return "rent/rent_payment";
	}
}
