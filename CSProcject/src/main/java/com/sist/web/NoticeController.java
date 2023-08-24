package com.sist.web;

import com.sist.dao.*;
import com.sist.vo.*;
import java.io.*;
import java.net.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
	
	@GetMapping("notice/notice_main.do")
	public String notice_main() {
		return "notice/notice_main";
	}
	
	@GetMapping("notice/notice_insert.do")
	public String notice_insert()
	{
		return "notice/notice_insert";
	}
	
	@GetMapping("notice/notice_detail.do")
	public String notice_detail(int nno, Model model)
	{
		model.addAttribute("nno", nno);
		return "notice/notice_detail";
	}
	
	@GetMapping("notice/notice_download.do")
	public void notice_fileDownload(String fn, HttpServletRequest request, HttpServletResponse response)
	{
		String path = request.getSession().getServletContext().getRealPath("/")+"upload\\";
		path = path.replace("\\", File.separator);
		
		try {
			 File file=new File(path+fn);
			   response.setHeader("Content-Disposition", "attachement;filename="+URLEncoder.encode(fn,"UTF-8"));
			   response.setContentLength((int)file.length());
			   
			   BufferedInputStream bis=
					   new BufferedInputStream(new FileInputStream(file));
			   BufferedOutputStream bos=
					   new BufferedOutputStream(response.getOutputStream());
			   int i=0; 
			   byte[] buffer=new byte[1024];
			   while((i=bis.read(buffer, 0, 1024))!=-1)
			   {
				   bos.write(buffer, 0, i);
			   }
			   bis.close();
			   bos.close();
		}catch(Exception ex) {}
		
	}
	
	@GetMapping("notice/notice_update.do")
	public String notice_update(int nno, Model model)
	{
		model.addAttribute("nno", nno);
		return "notice/notice_update";
	}
}
