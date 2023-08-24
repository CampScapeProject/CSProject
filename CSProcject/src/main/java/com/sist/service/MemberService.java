package com.sist.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.MemberVO;
import com.sist.vo.ShopVO;

public interface MemberService {
 
	   public void join(MemberVO vo);
	   
	   public int id_count(String id);
	   
	   public int email_count(String email);

	   public MemberVO login(String id); 
	   
	   public String email_id_find(String email);

	   public void member_update(MemberVO vo);
	   
	   public String member_password(String id);

	   public List<MemberVO> member_list();

	   public MemberVO member_detail(String id);
	   
	   public void admin_member_update(MemberVO vo);

}
