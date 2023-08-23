package com.sist.dao;

import com.sist.vo.*;
import com.sist.mapper.*;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAO {
	
	@Autowired
	private QnaMapper mapper;
	
	public List<QnaVO> qnaListData(Map map)
	{
		return mapper.qnaListData(map);
	}
	
	public List<QnaVO> qnaCategoryListData(Map map)
	{
		return mapper.qnaCategoryListData(map);
	}
	
	public int qnaTotalpage()
	{
		return mapper.qnaTotalpage();
	}
	
	public void qnaInsert(QnaVO vo)
	{
		mapper.qnaInsert(vo);
	}
	
}
