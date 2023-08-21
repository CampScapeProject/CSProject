package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO dao;

	@Override
	public void join(MemberVO vo) {
		dao.join(vo);
	}

	@Override
	public int id_count(String id) {
		return dao.id_count(id);
	}

	@Override
	public int email_count(String email) {
		return dao.email_count(email);
	}

	@Override
	public MemberVO login(String id) {
		return dao.login(id);
	}

	@Override
	public String email_id_find(String email) {
		return dao.email_id_find(email);
	}
	
	
	
}
