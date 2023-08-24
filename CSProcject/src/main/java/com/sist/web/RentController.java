package com.sist.web;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.RentDAO;
import com.sist.vo.RentVO;

@Controller
public class RentController {
	
	@GetMapping("rent/rent_main.do")
	public String rent_main() {
		
		return "rent/rent_main";
	}
	
	@GetMapping("rent/rent_detail.do")
	public String rent_detail(int rno, String date, Model model, HttpServletResponse response, HttpServletRequest request) throws Exception {
		Cookie[] cookies=request.getCookies();
		if(cookies!=null) {
			for(int i=cookies.length-1;i>=0;i--) {
				String key=cookies[i].getName();
				if(key.equals("rent_"+rno)) {
					cookies[i].setMaxAge(0); // 쿠키를 삭제하기 위해 만료시간을 0으로 설정
	                cookies[i].setPath("/");
	                response.addCookie(cookies[i]);
				}
			}
		}
		
		String data=rno+"#"+URLEncoder.encode(date, "UTF-8");
		Cookie cookie=new Cookie("rent_"+rno, data);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
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
	
	@GetMapping("mypage/review_write.do")
	public String mypage_review(int rno, Model model) {
		model.addAttribute("rno", rno);
		return "review_write";
	}
}
