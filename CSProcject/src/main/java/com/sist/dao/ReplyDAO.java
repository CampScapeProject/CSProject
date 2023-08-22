package com.sist.dao;

import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {
	
	@Autowired
	private ReplyMapper mapper;
	
	public int recipeReplyCount(int rno)
	{
		return mapper.recipeReplyCount(rno);
	}
	
	public List<ReplyVO> recipeReplyList(int rno)
	{
		return mapper.recipeReplyList(rno);
	}
	
	public void recipeReplyInsert(ReplyVO vo)
	{
		mapper.recipeReplyInsert(vo);
	}
	
	public void recipeReplyUpdate(ReplyVO vo)
	{
		mapper.recipeReplyUpdate(vo);
	}
	
	public void recipeReplyDelete(int rpno)
	{
		mapper.recipeReplyDelete(rpno);
	}
	
}
