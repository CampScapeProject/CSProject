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
	
	public int qnaTotalpage()
	{
		return mapper.qnaTotalpage();
	}
	
}
