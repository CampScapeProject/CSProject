package com.sist.dao;

import com.sist.vo.*;
import com.sist.mapper.*;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
	
	public QnaVO qnaDetailData(int qno)
	{
		mapper.hitIncrement(qno);
		return mapper.qnaDetailData(qno);
	}
	 
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void qnaReplyInsert(int root, QnaVO vo)
	{
		QnaVO qvo = mapper.qnaParentInfo(root);
		
		mapper.qnaGroupStepIncrement(qvo);
		vo.setGroup_id(qvo.getGroup_id());
		vo.setGroup_step(qvo.getGroup_step()+1);
		vo.setGroup_tab(qvo.getGroup_tab()+1);
		vo.setRoot(root);
		
		vo.setOpen("y");
		vo.setQcno(qvo.getQcno());
		
		mapper.qnaReplyInsert(vo);
		mapper.qnaDepthIncrement(root);
	}
	
	public QnaVO qnaUpdateData(int qno)
	{
		return mapper.qnaDetailData(qno);
	}
	
	public void qnaUpdate(QnaVO vo)
	{
		mapper.qnaUpdate(vo);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void qnaDelete(int qno)
	{
		QnaVO vo = mapper.qnaInfoData(qno);
		
		if(vo.getDepth()==0)
		{
			mapper.qnaDelete(qno);
		}
		else {
			mapper.qnaTitleUpdate(qno);
		}
		
		mapper.qnaDepthDecrement(qno);
	}
	
}
