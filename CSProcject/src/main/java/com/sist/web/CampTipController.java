package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CampTipController {
	@GetMapping("camptip/camptip_main.do")
	public String camptip_main() {
		return "camptip/camptip_main";
	}
}
