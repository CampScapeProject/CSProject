package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class NoticeController {
	@GetMapping("notice/notice_main.do")
	public String notice_main() {
		return "notice/notice_main";
	}
	
	@GetMapping("notice/notice_insert.do")
	public String notice_insert()
	{
		return "notice/notice_insert";
	}
	
	@GetMapping("notice/notice_detail")
	public String notice_detail(int nno, Model model)
	{
		model.addAttribute("nno", nno);
		return "notice/notice_detail";
	}
}
