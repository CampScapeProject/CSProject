package com.sist.dao;

import java.util.List;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.*;
import com.sist.vo.MemberVO;


@Repository
public class MemberDAO {

   @Autowired
   private MemberMapper mapper;
     
//   @Insert("INSERT INTO mymember VALUES(#{id},#{pwd},#{email},#{name},#{nickname},"
//         + "#{sex},#{birth},#{phone},#{post},#{addr1},#{addr2})") 
   public void join(MemberVO vo) {
      mapper.join(vo);  
   }
   
//   @Select("SELECT COUNT(*) FROM mymember WHERE id=#{id}")
   public int id_count(String id) {
      return mapper.id_count(id);
   }
   
//   @Select("SELECT COUNT(*) FROM member WHERE email=#{email}")
   public int email_count(String email) {
	   return mapper.email_count(email);
   }
   
//   @Select("SELECT id,pwd,email,name,nickname,sex,birth,phone,post,addr1,addr2 FROM mymember "
//         + "WHERE id=#{id}")
   public MemberVO login(String id) {
      return mapper.login(id);
   }
   
//   @Select("SELECT SELECT RPAD(SUBSTR(id, 1, 4), LENGTH(id), '*')  FROM member WHERE email=#{email}")
   public String email_id_find(String email) {
	   return mapper.email_id_find(email);
   }
   
//   @Update("UPDATE member SET id=#{id},eamil=#{email},name=#{name},nickname=#{nickname},sex=#{sex},"
//	   		+ "birth=#{birth},phone=#{phone},post=#{post},addr1=#{addr1},addr2=#{addr2} "
//	   		+ "WHERE=#{id}")
   public void member_update(MemberVO vo) {
	   mapper.member_update(vo);
   }
   
//   @Select("SELECT pwd FROM member WHERE id=#{id}")
    public String member_password(String id) {
	   return mapper.member_password(id);
   }
    
//    @Select("SELECT * FROM member")
    public List<MemberVO> member_list() {
    	return mapper.member_list();
    }
    
//    @Select("SELECT * FROM member WHERE id=#{id}")
    public MemberVO member_detail(String id) {
    	return mapper.member_detail(id);
    }

//    @Update("UPDATE member SET email=#{email},name=#{name},nickname=#{nickname},sex=#{sex},"
//	   		+ "birth=#{birth},phone=#{phone},post=#{post},addr1=#{addr1},addr2=#{addr2},admin=#{admin} "
//	   		+ "WHERE id=#{id}")
   public void admin_member_update(MemberVO vo) {
	   mapper.admin_member_update(vo);
   }
   
}