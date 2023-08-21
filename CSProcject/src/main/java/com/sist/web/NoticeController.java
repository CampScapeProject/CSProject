package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class NoticeController {
	@GetMapping("notice/notice_main.do")
	public String notice_main() {
		return "notice/notice_main";
	}
	
	@GetMapping("notice/notice_write.do")
	public String notice_insert()
	{
		return "notice/notice_insert";
	}
}
