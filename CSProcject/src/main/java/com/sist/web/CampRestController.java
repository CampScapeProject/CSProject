package com.sist.web;

import java.lang.ProcessBuilder.Redirect;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.CampDAO;
import com.sist.vo.CampVO;
import com.sist.vo.PageVO;
import com.sist.vo.RentVO;
import com.sist.vo.TourVO;

@RestController
public class CampRestController {
	@Autowired
	private CampDAO dao;
	
	
	
	//메인 리스트 출력
	@GetMapping(value = "camp/camp_main_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String campMainList() throws Exception
	{
		List<CampVO> list=dao.campMainList();
		
		for(CampVO vo:list)
		{
			String img=vo.getImage();
			if(img.contains("^"))
			{
				img=img.substring(0,img.indexOf("^"));
				vo.setImage(img);
			}
			int price=Integer.parseInt(vo.getMprice());
			
			DecimalFormat df=new DecimalFormat("###,###,###");
			String Fprice=df.format(price);
			vo.setMprice(Fprice); 
		}
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	
	///////////////////
	
	@GetMapping(value = "camp/camp_find_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String campFindList(int page,String rdate,String state,String spricefd,String epricefd,String campfd) throws Exception
	{
		
		Map map = new HashMap();
		int rowsize = 4;
		int start = (rowsize * page) - (rowsize - 1);
		int end = rowsize * page;
		map.put("start", start);
		map.put("end", end);
		
		
		System.out.println("데이터:"+rdate);
		System.out.println("데이터장소:"+state);
		System.out.println("데이터값시작:"+spricefd);
		System.out.println("데이터값끝:"+epricefd);
		System.out.println("데이터 네임:"+campfd);
		//2023-08-23 - 2023-08-24
		String sdate=rdate.split(" - ")[0];
		String edate=rdate.split(" - ")[1];
		map.put("sdate", sdate);
		map.put("edate", edate);
		
	
		
		String sp=spricefd;
		String ep=epricefd;
		
		if(sp !=null || ep !=null)
		{
			sp=sp.replace(",", "");
			ep=ep.replace(",", "");
		}else {
			sp="0";
			ep="1100000";
		}
		
		map.put("spricefd", sp);
		map.put("epricefd", ep);
		
		map.put("campfd", campfd);
		map.put("state", state);
		
		
		List<CampVO> list=dao.campFindData(map);
		
		/*
		 * for(CampVO cvo:slist) { int price=dao.campPrice(cvo.getCno());
		 * map.put("price", price); }
		 * 
		 * List<CampVO> list=dao.campFindData(map);
		 */
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	
	
	@GetMapping(value = "camp/camp_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String campListData(int page,String type) throws Exception
	{
		Map map = new HashMap();
		if(type.equals("list"))
		{
			int rowsize = 12;
			int start = (rowsize * page) - (rowsize - 1);
			int end = rowsize * page;
			map.put("start", start);
			map.put("end", end);
		}
		else
		{
			int rowsize = 4;
			int start = (rowsize * page) - (rowsize - 1);
			int end = rowsize * page;
			map.put("start", start);
			map.put("end", end);
			
		}
		
		List<CampVO> list=dao.campListData(map);
		for(CampVO vo:list)
		{
			String img=vo.getImage();
			if(img.contains("^"))
			{
				img=img.substring(0,img.indexOf("^"));
				vo.setImage(img);
			}
			String msg=vo.getMsg();
			if(msg.length()>70)
			{
				if(msg.contains("-"))
				{
					msg=msg.replace("-"," ");
				}
				msg=msg.substring(0, 68)+"...";
				vo.setMsg(msg);
			} 
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
	@GetMapping(value = "camp/camp_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String campDetail(int cno) throws Exception{
		
		CampVO vo=dao.campDetail(cno);
		String img=vo.getImage();
		if(img.contains("^"))
		{
			img=img.substring(0,img.indexOf("^"));
			vo.setImage(img);
		}
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
		
		String msg=vo.getMsg();
		
		if(msg.contains("-"))
		{
			msg=msg.replace("-"," ");
		}
		vo.setMsg(msg);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		
		return json;
	}
	
	@GetMapping(value = "camp/camp_cookie.do", produces = "text/plain;charset=UTF-8")
	public String rentCookieData(HttpServletRequest request) throws Exception {
		Cookie[] cookies=request.getCookies();

		List<CampVO> clist=new ArrayList<CampVO>();
		if(cookies!=null) {
			for(int i=cookies.length-1;i>=0;i--) {
				String key=cookies[i].getName();
				if(key.startsWith("camp_")) {
					String data=cookies[i].getValue();
					CampVO vo=new CampVO();
					vo=dao.campCookieData(Integer.parseInt(data));
					String name=vo.getName();
					if(name.length()>7) {
						vo.setName(name.substring(0,7)+"..");
					}
					clist.add(vo);
				}
			}
		}
		
		ObjectMapper mapper=new ObjectMapper();
		return mapper.writeValueAsString(clist);
	}
	
	@GetMapping(value = "camp/tour_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String tourList(String addr) throws Exception
	{
		String caddr=addr;
		if(caddr.contains("충청남도") || caddr.contains("충청북도") 
			|| caddr.contains("경상남도") || caddr.contains("경상북도") 
			|| caddr.contains("전라남도") || caddr.contains("전라북도")) {
			caddr=caddr.replace("충청남도", "충남");
			caddr=caddr.replace("충청북도", "충북");
			caddr=caddr.replace("경상남도", "경남");
			caddr=caddr.replace("경상북도", "경북");
			caddr=caddr.replace("전라남도", "전남");
			caddr=caddr.replace("전라북도", "전북");
			
		}
		
		String address=caddr.substring(0,1);
		
		
		List<TourVO> list=dao.tourListData(address);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		
		return json;
	}
	
}
