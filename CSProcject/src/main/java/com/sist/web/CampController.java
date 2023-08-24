package com.sist.web;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CampController {
	@GetMapping("camp/camp_main.do")
	public String camp_main() {
		return "camp/camp_main";
	}
	@GetMapping("camp/camp_list.do")
	public String camp_list(){
		return "camp/camp_list";
	}
	
	@GetMapping("camp/camp_detail.do")
	public String camp_detail(int cno,Model model,HttpServletResponse response, HttpServletRequest request){
		Cookie[] cookies=request.getCookies();
		if(cookies!=null) {
			for(int i=cookies.length-1;i>=0;i--) {
				String key=cookies[i].getName();
				if(key.equals("camp_"+cno)) {
					cookies[i].setMaxAge(0); // 쿠키를 삭제하기 위해 만료시간을 0으로 설정
	                cookies[i].setPath("/");
	                response.addCookie(cookies[i]);
				}
			}
		}
		
		Cookie cookie=new Cookie("camp_"+cno, String.valueOf(cno));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		model.addAttribute("cno",cno);
		return "camp/camp_detail";
	}
}
