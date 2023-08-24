package com.sist.service;

import java.util.List;

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

	@Override
	public void member_update(MemberVO vo) {
		dao.member_update(vo);
	}

	@Override
	public String member_password(String id) {
		return dao.member_password(id);
	}

	@Override
	public List<MemberVO> member_list() {
		return dao.member_list();
	}

	@Override
	public MemberVO member_detail(String id) {
		return dao.member_detail(id);
	}

	@Override
	public void admin_member_update(MemberVO vo) {
		dao.admin_member_update(vo);
	}
	
	
	
}
