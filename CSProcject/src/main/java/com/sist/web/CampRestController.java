package com.sist.web;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.CampDAO;
import com.sist.vo.CampVO;
import com.sist.vo.PageVO;

@RestController
public class CampRestController {
	@Autowired
	private CampDAO dao;
	
	
	
	/*
	 * @GetMapping(value = "camp/camp_main_vue.do",produces =
	 * "text/plain;charset=UTF-8") public String campListData() {
	 * 
	 * }
	 */
	@GetMapping(value = "camp/camp_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String campListData(int page) throws Exception
	{
		Map map = new HashMap();
		int rowsize = 20;
		int start = (rowsize * page) - (rowsize - 1);
		int end = rowsize * page;
		map.put("start", start);
		map.put("end", end);
		
		List<CampVO> list=dao.campListData(map);
		for(CampVO vo:list)
		{
			String img=vo.getImage();
			if(img.contains("^"))
			{
				img=img.substring(0,img.indexOf("^"));
				vo.setImage(img);
			}
			/*String msg=vo.getMsg();
			if(msg.length()>10)
			{
				msg=msg.substring(0, 8)+"...";
				vo.setMsg(msg);
			}*/
			int price=Integer.parseInt(vo.getMprice());
			
			DecimalFormat df=new DecimalFormat("###,###,###");
			String Fprice=df.format(price);
			vo.setMprice(Fprice); 
			
			String phoneNumber = vo.getPhone();
			String FphoneNumber = phoneNumber.substring(0, 3) 
								+ "-" 
								+ phoneNumber.substring(3, 7) 
								+ "-" 
								+ phoneNumber.substring(7);
			vo.setPhone(FphoneNumber);
		}
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
		
	}
	@GetMapping(value = "camp/camp_list_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String campPageListData(int page) throws Exception{
		
		
		int totalpage=dao.campTotalPage();
		final int BLOCK = 10;
		int startpage = ((page - 1) / BLOCK * BLOCK) + 1;
		int endpage = ((page - 1) / BLOCK * BLOCK) + BLOCK;
		if(endpage>totalpage)
			endpage=totalpage;
		
		PageVO vo = new PageVO();
		vo.setStartpage(startpage);
		vo.setEndpage(endpage);
		vo.setCurpage(page);
		vo.setTotalpage(totalpage);

		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);

		return json;
	}
	
}
