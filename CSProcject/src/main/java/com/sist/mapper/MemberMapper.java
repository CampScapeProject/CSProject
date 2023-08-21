package com.sist.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.GetMapping;
import com.sist.vo.MemberVO;

public interface MemberMapper {
   
   @Select("SELECT COUNT(*) FROM member WHERE id=#{id}")
   public int id_count(String id);
   
   @Select("SELECT COUNT(*) FROM member WHERE email=#{email}")
	   public int email_count(String email);

   @Select("SELECT id,pwd,email,name,nickname,sex,birth,phone,post,addr1,addr2,admin FROM member "
         + "WHERE id=#{id}")
   public MemberVO login(String id);
   
   @Insert("INSERT INTO member (id,pwd,email,name,nickname,sex,birth,phone,post,addr1,addr2) VALUES(#{id},#{pwd},#{email},#{name},#{nickname},"
         + "#{sex},#{birth},#{phone},#{post},#{addr1},#{addr2})")
   public void join(MemberVO vo);
   
   @Select("SELECT RPAD(SUBSTR(id, 1, 4), LENGTH(id), '*')  FROM member WHERE email=#{email}")
   public String email_id_find(String email);

}