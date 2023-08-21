package com.sist.web;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sist.dao.*;
import com.sist.service.MemberService;
import com.sist.vo.MemberVO;
import oracle.jdbc.proxy.annotation.Post;

@Controller
public class MemberController {     

   @Autowired
   private BCryptPasswordEncoder encoder;
   
   
   @RequestMapping("member/join.do")
   public String member_join(Model model) {
      
      return "member/join"; 
   }
   
   
   @RequestMapping("member/login.do")
   public String login(Model model) {

      return "member/login";
   }
   
   @GetMapping("member/logout.do")
   public String logout(HttpSession session) {
      session.invalidate();
      
      return "redirect:../main/home.do";
   }
   
   
   
   
   
   @RequestMapping("member/testLogin.do")
   public String logint(Model model) {

      return "member/testLogin";
   }
   

}