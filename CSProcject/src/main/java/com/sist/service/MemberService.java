package com.sist.service;

import com.sist.vo.MemberVO;

public interface MemberService {
 
	   public void join(MemberVO vo);
	   
	   public int id_count(String id);
	   
	   public int email_count(String email);

	   public MemberVO login(String id);
	   
	   public String email_id_find(String email);

}
