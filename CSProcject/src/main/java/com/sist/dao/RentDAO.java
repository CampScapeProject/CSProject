package com.sist.dao;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.RentMapper;
import com.sist.vo.MemberVO;
import com.sist.vo.RentVO;
import com.sist.vo.ReserveVO;
import com.sist.vo.ReviewVO;

@Repository
public class RentDAO {
	@Autowired
	private RentMapper mapper;
	
	public List<RentVO> rentListData(Map map){
		return mapper.rentListData(map);
	}
	
	public RentVO rentDetailData(int rno) {
		return mapper.rentDetailData(rno);
	}
	
	public RentVO rentCookieData(int rno) {
		return mapper.rentCookieData(rno);
	}
	
	public void jjimInsert(Map map) {
		mapper.jjimInsert(map);
	}
	
	public void jjimDelete(Map map) {
		mapper.jjimDelete(map);
	} 
	
	public ReviewVO reviewTotalData(int rno) {
		return mapper.reviewTotalData(rno);
	}
	
	public List<ReviewVO> rentReviewList(Map map) {
		return mapper.rentReviewList(map);
	}
	public int rentReviewTotalpage(int rno) {
		return mapper.rentReviewTotalpage(rno);
	}
	
	public MemberVO memberInfoData(String id) {
		return mapper.memberInfoData(id);
	}
	
	public void rent_reserve_insert(ReserveVO vo) {
		mapper.rent_reserve_insert(vo);
	} 
	
	public int reserveCheck(Map map) {
		return mapper.reserveCheck(map);
	}
	
	public List<ReserveVO> reserveListData(String id) {
		return mapper.reserveListData(id);
	}
	
	public void review_insert(Map map) {
		mapper.review_insert(map);
	}
	
	public void reserve_cancel_request(int rno) {
		mapper.reserve_cancel_request(rno);
	}

	public void reserve_request_cancel(int rno) {
		mapper.reserve_request_cancel(rno);
	}
	
	public List<ReviewVO> rent_review_list(Map map){
		return mapper.rent_review_list(map);
	}
	
	public int reviewTotalPage(String id) {
		return mapper.reviewTotalPage(id);
	}
	
	public List<RentVO> adminRentListData(Map map){
		return mapper.adminRentListData(map);
	}
	
	public int adminRentTotalpage(String fd) {
		return mapper.adminRentTotalpage(fd);
	}

	public void insertRent(RentVO vo) {
		mapper.insertRent(vo);
	}
	
	public void updateRent(RentVO vo) {
		mapper.updateRent(vo);
	}

	public List<ReserveVO> adminReserveListData(Map map){
		return mapper.adminReserveListData(map);
	}
}
