package com.sist.web;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController; 

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.MemberDAO;
import com.sist.service.MemberService;
import com.sist.vo.MemberVO;

@RestController
public class MemberRestController {

	@Autowired
	private MemberService service;
	
    @Autowired
   private BCryptPasswordEncoder encoder;
   
   @PostMapping(value="member/login_ok.do",produces = "text/plain;charset=UTF-8")
   public String login_ok(String id,String pwd,HttpSession session) {

      String result="";
      
      int count=service.id_count(id);
      
      if(count==0) {
         result="NOID";
      } else {
         MemberVO vo=service.login(id);
         if(encoder.matches(pwd, vo.getPwd())) {
            result="OK";
            session.setAttribute("id", vo.getId());
            session.setAttribute("name", vo.getName());
            session.setAttribute("nickname", vo.getNickname());
            session.setAttribute("email", vo.getEmail());
            session.setAttribute("phone", vo.getPhone());
            session.setAttribute("sex", vo.getSex());
            session.setAttribute("admin", vo.getAdmin());
            session.setAttribute("post", vo.getPost());
            session.setAttribute("addr1", vo.getAddr1());
            session.setAttribute("addr2", vo.getAddr2());
            session.setAttribute("birth", vo.getBirth());
      
         } else {
            result="NOPWD";
         }
      }
      
      return result;
   }
   
   
   @PostMapping(value = "member/join_ok.do",produces = "text/plain;charset=UTF-8")
   public String join(MemberVO vo) {
      
      String result="";
      
      try {
         String en=encoder.encode(vo.getPwd());
         vo.setPwd(en);
         service.join(vo);
         result="YES";
      } catch(Exception ex) {
         ex.printStackTrace();
         result="NO";
      }
      
      return result;
   }
   
   @RequestMapping(value="member/idCheck.do",produces = "text/plain;charset=UTF-8")
   public String idCheck(String id) {
      String result="";
      
      int count=service.id_count(id);
      
      if(count==0) {
         result="OK";
      } else {
         result="NO";
      }
      
      return result;
   }
   
   @GetMapping(value = "member/email_check_vue.do",produces = "text/plain;charset=UTF-8")
   public String member_emailCheck(String email)
   {
	   String result="";
	   int count=service.email_count(email);
	   if(count!=0)
	   {
		   result="no";  
	   }
	   else
	   {
		   result=email;
	   }
	   return result;
   }
   
   @GetMapping(value="member/id_find_vue.do",produces = "text/plain;charset=UTF-8")
   public String id_find(String email) {
	   
	   String result="";
	   
	   int count=service.email_count(email);
	   String id=service.email_id_find(email);
	   
	   if(count!=0) {
		   result=id;
	   } else {
		   result="no";
	   }
	   return result;
   }
   
   @RequestMapping(value="mypage/pwd_check.do",produces = "text/plain;charset=UTF-8")
   public String pwd_check(String pwd,HttpSession session) {
	   
	   String result="no";

	   String db_id=(String) session.getAttribute("id");

	   String db_pwd=service.member_password(db_id);

			if(encoder.matches(pwd, db_pwd)) {
				result="ok";
			}
			System.out.println(result);
			   return result;
	   }

   
   @RequestMapping(value="mypage/update_ok.do",produces = "text/plain;charset=UTF-8")
   public String member_update(MemberVO vo) {

	   service.member_update(vo);
	   
	   return "YES";
	   
   }
   
   @GetMapping(value="adminpage/member_list_vue.do",produces = "text/plain;charset=UTF-8")
   public String member_list() throws Exception {   
	   
	   List<MemberVO> list=service.member_list();
	   
	   ObjectMapper mapper=new ObjectMapper();
	   String json=mapper.writeValueAsString(list);
	   
	   return json;
	   
   }
   
   @PostMapping(value="adminpage/member_detail_vue.do",produces = "text/plain;charset=UTF-8")
   public String member_detail(String id) throws Exception {

	   MemberVO vo=service.member_detail(id);
	   
	   ObjectMapper mapper=new ObjectMapper();
	   String json=mapper.writeValueAsString(vo);
	   
	   return json;
	   
   }
   
   @PostMapping(value="adminpage/member_update_vue.do",produces = "text/plain;charset=UTF-8")
   public void admin_member_update(MemberVO vo) {
	   
	   service.admin_member_update(vo);
	    
   }
   
   
}