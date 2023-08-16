package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CampController {
	@GetMapping("camp/camp_main.do")
	public String camp_main() {
		return "camp/camp_main";
	}
}
