package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QnaController {
	@GetMapping("qna/qna_main.do")
	public String qna_main(int qcno, Model model, HttpSession session) {
		
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		String admin = (String)session.getAttribute("admin");
		
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		model.addAttribute("admin", admin);
		model.addAttribute("qcno", qcno);
		return "qna/qna_main";
	}
	 
	@GetMapping("qna/qna_insert.do")
	public String qna_insert() {
		return "qna/qna_insert";
	}
	
	@GetMapping("qna/qna_detail.do")
	public String qna_detail(int qno, Model model)
	{
		model.addAttribute("qno", qno);
		return "qna/qna_detail";
	}
	
	@GetMapping("qna/reply_insert.do")
	public String qna_reply_insert(int qno, Model model)
	{
		model.addAttribute("qno", qno);
		return "qna/qna_reply_insert";
	}
	
	@GetMapping("qna/qna_update.do")
	public String qna_update(int qno, Model model)
	{
		model.addAttribute("qno", qno);
		return "qna/qna_update";
	}
}
