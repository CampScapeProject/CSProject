package com.sist.rest;

import java.io.*;
import java.util.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;
import com.sist.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class NoticeRestController {
	
	@Autowired
	private NoticeDAO dao;
	
	@GetMapping(value = "notice/notice_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String notice_list_vue(int page) throws Exception
	{	
		Map map = new HashMap();
		int rowSize = 10;
		int start = (rowSize*page)-(rowSize-1);
		int end = rowSize*page;
		map.put("start", start);
		map.put("end", end);
		
		List<NoticeVO> list = dao.noticeListData(map);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value = "notice/notice_page_vue.do", produces = "text/plain;charset=UTF-8")
	public String notice_page(int page) throws Exception
	{
		int totalpage = dao.noticeTotalpage();
		
		final int BLOCK = 5;
		int startpage = ((page-1)/BLOCK*BLOCK)+1;
		int endpage = ((page-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endpage>totalpage)
			endpage = totalpage;
		
		PageVO vo = new PageVO();
		vo.setTotalpage(totalpage);
		vo.setCurpage(page);
		vo.setStartpage(startpage);
		vo.setEndpage(endpage);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		return json;
	}
	
	@PostMapping(value = "notice/notice_insert_vue.do", produces = "text/plain;charset=UTF-8")
	public void notice_insert_ok(@ModelAttribute NoticeVO vo, HttpServletRequest request, HttpSession session)
	{

		String id = (String)session.getAttribute("id");
		vo.setId(id);
		
		String path = request.getSession().getServletContext().getRealPath("/")+"upload\\";
		System.out.println(path);
		
		 path=path.replace("\\", File.separator);
		 List<MultipartFile> list = vo.getImages();
		 
		 if(list==null)
		 {
			 vo.setFilename("");
			 vo.setFilesize("");
			 vo.setFilecount(0);
			 
		 }
		 else {
			 
			 String fn="";
			 String fs="";
			 
			 for(MultipartFile mf:list)
			 {
				 String name = mf.getOriginalFilename();
				 File file = new File(path+name);
				 
				 try {
					 mf.transferTo(file);
				 }catch(Exception ex) {}
				 
				 fn+=name+',';
				 fs+=file.length()+",";
			 }
			 
			 fn = fn.substring(0, fn.lastIndexOf(","));
			 fs = fs.substring(0, fs.lastIndexOf(","));
			 vo.setFilecount(list.size());
			 vo.setFilename(fn);
			 vo.setFilesize(fs);
		 }
		 
		 dao.noticeInsert(vo);
	}
	
	@GetMapping(value = "notice/notice_detail_vue.do", produces = "text/plain;charset=UTF-8")
	public String notice_detail(int nno) throws Exception
	{
		NoticeVO vo = dao.noticeDetailData(nno);
		
		System.out.println("파일 이름 : "+vo.getFilename()+" 파일 사이즈 : "+vo.getFilesize());
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		return json;
	}
	
	@GetMapping(value = "notice/notice_update_vue.do", produces = "text/plain;charset=UTF-8")
	public String notice_update(int nno) throws Exception
	{
		NoticeVO vo = dao.noticeUpdateData(nno);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		return json;
	}
	
	@PostMapping(value = "notice/notice_update_ok_vue.do", produces = "text/plain;charset=UTF-8")
	public void notice_update_ok(NoticeVO vo)
	{
		dao.noticeUpdate(vo);
	}
	
	@GetMapping(value = "notice/notice_delete_vue.do", produces = "text/plain;charset=UTF-8")
	public void notice_delete_ok(int nno, HttpServletRequest request)
	{
		NoticeVO vo = dao.databoardFileInfoData(nno);
		
		try {
			if(vo.getFilecount()!=0)
			{
				String path = request.getSession().getServletContext().getRealPath("/")+"upload\\";
				path = path.replace("\\", File.separator);
				StringTokenizer st = new StringTokenizer(vo.getFilename(), ",");
				
				while(st.hasMoreTokens())
				{
					path = path+st.nextToken();
					File file = new File(path);
					file.delete();
				}
			}
		}catch(Exception ex) {}
		
		dao.noticeDelete(nno);
	}
	
	
}
