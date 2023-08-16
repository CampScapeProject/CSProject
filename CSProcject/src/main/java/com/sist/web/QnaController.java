package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QnaController {
	@GetMapping("qna/qna_main.do")
	public String qna_main() {
		return "qna/qna_main";
	}
}
