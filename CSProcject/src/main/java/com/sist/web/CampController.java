package com.sist.web;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public String camp_detail(int cno,String rdate,Model model,HttpServletResponse response, HttpServletRequest request,HttpSession session)throws Exception
	{
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		String email = (String)session.getAttribute("email");
		String phone = (String)session.getAttribute("phone");
		model.addAttribute("id",id);
		model.addAttribute("name",name);
		model.addAttribute("email",email);
		model.addAttribute("phone",phone);  
		
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
		
		if(rdate!=null) 
		{
			
			String sdate=rdate.split(" - ")[0];
			String edate=rdate.split(" - ")[1];
			model.addAttribute("sdate",sdate);
			model.addAttribute("edate",edate);
			
			System.out.println("s:"+sdate+"e:"+edate);
		}
		
		Cookie cookie=new Cookie("camp_"+cno, String.valueOf(cno));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		model.addAttribute("cno",cno);
		return "camp/camp_detail";
	}
	@GetMapping("camp/camp_reserve.do")
	public String camp_reserve()
	{
		return "camp/camp_reserve";
	}
}
