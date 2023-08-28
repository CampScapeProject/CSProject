package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.sist.vo.RecipeVO;

@Controller
public class RecipeController {
	@GetMapping("recipe/recipe_main.do")
	public String recipe_main() {
		return "recipe/recipe_main";
	}
	
	@GetMapping("recipe/recipe_detail.do")
	public String recipe_detail(int rno, HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("id");
		
		model.addAttribute("rno", rno);
		model.addAttribute("id", id);
		return "recipe/recipe_detail";
	}
	
	
}
