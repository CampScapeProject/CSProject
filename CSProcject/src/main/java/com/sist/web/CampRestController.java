package com.sist.web;

import java.io.File;
import java.lang.ProcessBuilder.Redirect;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.CampDAO;
import com.sist.mail.MailManager;
import com.sist.vo.CampSiteVO;
import com.sist.vo.CampVO;
import com.sist.vo.JjimVO;
import com.sist.vo.PageVO;
import com.sist.vo.RentVO;
import com.sist.vo.ReserveVO;
import com.sist.vo.ReviewVO;
import com.sist.vo.TourVO;

import oracle.jdbc.proxy.annotation.Post;

@RestController
public class CampRestController {
	@Autowired
	private CampDAO dao;
	
	@Autowired
	private MailManager manager;
	
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
		
		String sdate="";
		String edate="";
		if(rdate!="")
		{
			sdate=rdate.split(" - ")[0];
			edate=rdate.split(" - ")[1];
			
		}
		map.put("sdate", sdate);
		map.put("edate", edate);
		
		String sp=spricefd;
		String ep=epricefd;
		
		if(sp ==null && ep ==null)
		{
			sp="0";
			ep="1100000";
		}
		else 
		{
			if(sp.trim() !="" || ep.trim() !="")
			{
				sp=sp.replace(",", "");
				ep=ep.replace(",", "");
			}else {
				sp="0";
				ep="1100000";
			}
		}
		
		
		
		if(state.equals("지역을 선택하세요"))
		{
			state=null;
		}
		
		map.put("spricefd", Integer.parseInt(sp));
		map.put("epricefd", Integer.parseInt(ep));
		
		map.put("campfd", campfd);
		map.put("state", state);
		

	
		
		List<CampVO> list=dao.campFindData(map);
		
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
		
		Map tmap = new HashMap();
		tmap.put("sdate", sdate);
		tmap.put("edate", edate);
		tmap.put("spricefd", Integer.parseInt(sp));
		tmap.put("epricefd", Integer.parseInt(ep));
		
		tmap.put("campfd", campfd);
		tmap.put("state", state);
		
		int totalpage=dao.campFindTotal(tmap);
		final int BLOCK = 5;
		int startpage = ((page - 1) / BLOCK * BLOCK) + 1;
		int endpage = ((page - 1) / BLOCK * BLOCK) + BLOCK;
		if(endpage>totalpage)
			endpage=totalpage;
		
		Map jmap = new HashMap();
		jmap.put("curpage", page);
		jmap.put("totalpage", totalpage);
		jmap.put("startpage", startpage);
		jmap.put("endpage", endpage);
		jmap.put("list", list);
		
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(jmap);
		return json;
	}
	
	

	
	
	@GetMapping(value = "camp/camp_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String campListData(int page) throws Exception
	{
		Map map = new HashMap();
	
			int rowsize = 12;
			int start = (rowsize * page) - (rowsize - 1);
			int end = rowsize * page;
			map.put("start", start);
			map.put("end", end);
			/*
			 * map.put("select", select);
			 */		
		
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
	public String campPageListData(int page,String type) throws Exception{
		
		PageVO vo = new PageVO();
		if(type.equals("list"))
		{
			int totalpage=dao.campTotalPage();
			final int BLOCK = 10;
			int startpage = ((page - 1) / BLOCK * BLOCK) + 1;
			int endpage = ((page - 1) / BLOCK * BLOCK) + BLOCK;
			if(endpage>totalpage)
				endpage=totalpage;
			
			vo.setStartpage(startpage);
			vo.setEndpage(endpage);
			vo.setCurpage(page);
			vo.setTotalpage(totalpage);
		}else {
			int totalpage=dao.campTotalMainPage();
			final int BLOCK = 5;
			int startpage = ((page - 1) / BLOCK * BLOCK) + 1;
			int endpage = ((page - 1) / BLOCK * BLOCK) + BLOCK;
			if(endpage>totalpage)
				endpage=totalpage;
			
			vo.setStartpage(startpage);
			vo.setEndpage(endpage);
			vo.setCurpage(page);
			vo.setTotalpage(totalpage);
		}

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
	
	/*---------- 예약 -----------*/
	
	@GetMapping(value = "camp/campsite_list.do",produces = "text/plain;charset=UTF-8")
	public String campsite_list_vue(int cno) throws Exception
	{
		List<CampSiteVO> list=dao.campSiteList(cno); 
		
		for(CampSiteVO cvo:list)
		{
			int price=Integer.parseInt(cvo.getPrice());
			DecimalFormat df=new DecimalFormat("###,###,###");
			String Fprice=df.format(price);
			cvo.setPrice(Fprice); 
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		
		return json;
	}
	
	@GetMapping(value = "camp/campsite_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String campsite_detail_vue(int csno) throws Exception
	{
		CampSiteVO vo=dao.campSiteDetail(csno);
		
		int price=Integer.parseInt(vo.getPrice());
		
		DecimalFormat df=new DecimalFormat("###,###,###");
		String Fprice=df.format(price);
		
		if(Fprice.contains(","))
		{
			Fprice=Fprice.replace(",","");
		}
		vo.setDbprice(Integer.parseInt(Fprice));
  
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		
		return json;  
	}
	
	
		
	  @PostMapping(value = "camp/camp_reserve_ok_vue.do",produces ="text/plain;charset=UTF-8") 
	  public String camp_reserve_ok_vue(ReserveVO vo,int page) throws Exception 
	  {
		  
		  System.out.println("server진입 성공");
		   System.out.println("name:"+vo.getName());
		   System.out.println("email:"+vo.getEmail());
		   System.out.println("msg:"+vo.getMsg());
		   System.out.println("phone:"+vo.getPhone());
		   System.out.println("csno:"+vo.getCsno());
		   System.out.println("fno:"+vo.getFno());
		   System.out.println("inwon:"+vo.getInwon());
		   System.out.println("dbsdate:"+vo.getDbsdate());
		   System.out.println("dbedate:"+vo.getDbedate());
		   System.out.println("price:"+vo.getPrice());
		   System.out.println("page:"+page);
		   
		   
		   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        Date sdate = dateFormat.parse(vo.getDbsdate());
	        Date edate = dateFormat.parse(vo.getDbedate());
	        vo.setSdate(sdate);
	        vo.setEdate(edate);
	        
	        System.out.println("sdate:"+vo.getSdate());
	        System.out.println("edate:"+vo.getEdate());
	        
	        String phone=vo.getPhone();
	        if(phone.contains("-"))
			{
				phone=phone.replace("-"," ");
			}
	        vo.setPhone(phone);
	        
	        String price=vo.getPrice();
	        if(price.contains(","))
			{
				price=price.replace(","," ");
			}
	        vo.setPrice(price);
	        
		  dao.campReserveInsert(vo);
		  System.out.println("예약 성공");
		  
			/*
			 * Map map = new HashMap(); int rowsize = 4; int start = (rowsize * page) -
			 * (rowsize - 1); int end = rowsize * page; map.put("start", start);
			 * map.put("end", end);
			 * 
			 * List<CampVO> list=dao.campListData(map);
			 * 
			 * ObjectMapper mapper = new ObjectMapper(); String json =
			 * mapper.writeValueAsString(list);
			 */
			
		  return "OK";
	  }
	 


	/* -------------------------------- */
	
	
	/* -------- 리뷰 --------      */
	
	public String camp_review_list_data(int page,int cno) throws Exception
	{ 
		System.out.println("page:"+page);
		
		Map map = new HashMap();
		int rowsize = 5;
		int start = (rowsize * page) - (rowsize - 1);
		int end = rowsize * page;
		map.put("start", start);
		map.put("end", end);
		map.put("type", "c");
		map.put("cno", cno);
		
		List<ReviewVO> list=dao.campReviewList(map);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
	
		return json;
		
	}
	
	@PostMapping(value = "camp/camp_review_insert_vue.do",produces = "text/plain;charset=UTF-8")
	public String camp_review_insert(ReviewVO vo,MultipartFile imagefile, HttpServletRequest request)
	{
		String path = request.getSession().getServletContext().getRealPath("/")+"layout\\upload-camp\\"+imagefile.getOriginalFilename();
		path=path.replace("\\", File.separator); // os에 따른 경로 구분자 변경
		
		try {
			imagefile.transferTo(new File(path));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		vo.setImage("../layout/upload-camp/"+imagefile.getOriginalFilename());
		
		dao.campReviewInsert(vo);
		return "";
	}
	
	
	
	
	@GetMapping(value = "camp/camp_review_vue.do",produces = "text/plain;charset=UTF-8")
	public String camp_review_list(int page,int cno)throws Exception
	{ 
	
		return camp_review_list_data(page,cno);
		
	}
	
	@GetMapping(value = "camp/camp_count_vue.do",produces = "text/plain;charset=UTF-8")
	public String camp_count(int cno,int page)throws Exception
	{
		Map map = new HashMap();
		map.put("type", "c");
		map.put("cno", cno);
		
		int rcount=dao.campReviewCount(map);
		//rcount=rcount-(10*(page-1));
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(rcount);
	
		return json;
		
	}
	
	@GetMapping(value = "camp/camp_review_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String camp_review_page(int page,int cno) throws Exception
	{
		
		Map map = new HashMap();
		map.put("type", "c");
		map.put("cno", cno);
		int total=dao.campReviewTotal(map);
		
		PageVO vo=new PageVO();
		vo.setCurpage(page);
		vo.setTotalpage(total);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
	
		return json;
	}
	
	@GetMapping(value = "camp/camp_review_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String camp_review_detail(int no)  throws Exception
	{
		
		ReviewVO vo=dao.campReviewDetail(no);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
	
		return json;
	}
	
	@GetMapping(value = "camp/camp_review_delete_vue.do",produces = "text/plain;charset=UTF-8")
	public String camp_review_delete(int no,int cno,int page) throws Exception
	{
		System.out.println("no:"+no);
		System.out.println("실행됨");
		
		dao.campReviewDelete(no);
		System.out.println("실행됨2");
		
		return camp_review_list_data(page,cno);
		
	}
	
	@GetMapping(value = "camp/camp_review_update_data_vue.do",produces = "text/plain;charset=UTF-8")
	public String camp_review_update_data(int no) throws Exception
	{
		ReviewVO vo=dao.campUpdateData(no);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
	
		return json;
	}
	@PostMapping(value = "camp/camp_review_update_vue.do",produces = "text/plain;charset=UTF-8")
	public String camp_review_update(int no,int cno,int page,String content,String subject) throws Exception
	{
		
		System.out.println("sub:"+subject);
		System.out.println("cont:"+content);
		Map map = new HashMap();
		map.put("cont", content);
		map.put("sub", subject);
		map.put("no", no);
		
		dao.campReviewUpdate(map);
		
		return camp_review_list_data(page,cno);
	}
	
	
	
	// 마이페이지
	
	@GetMapping(value = "mypage/camp_reserve_list.do",produces = "text/plain;charset=UTF-8")
	public String mypage_camp_reserve_list(String id) throws Exception
	{
		
		List<ReserveVO> list=dao.campMypageReserveList(id);
		for(ReserveVO vo:list)
		{
			String img=vo.getImage();
			if(img.contains("^"))
			{
				img=img.substring(0,img.indexOf("^"));
				vo.setImage(img);
			}
			int price=Integer.parseInt(vo.getPrice());
			
			DecimalFormat df=new DecimalFormat("###,###,###");
			String Fprice=df.format(price);
			vo.setPrice(Fprice); 
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
	
		return json;
	}
	
	@GetMapping(value = "mypage/camp_reserve_delete.do",produces = "text/plain;charset=UTF-8")
	public String mypage_camp_reserve_delete(int rno) 
	{
		dao.campMyReserveDelete(rno);
		
		return"OK";
	}
	
	
	@GetMapping(value = "mypage/camp_myreview.do",produces = "text/plain;charset=UTF-8")
	public String mypage_camp_myreview(String id) throws Exception
	{
		List<ReviewVO> list=dao.mypageReiview(id);
		
		for(ReviewVO vo:list)
		{
			
			String img=vo.getImage();
			
			if(img.contains("^"))
			{
				img=img.substring(0,img.indexOf("^"));
				vo.setImage(img);
			}
			
		} 
			
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
	
		return json;
		
	}
	//관리자 페이지
	
	
	public String admin_camp_reserve_list_data(int page,String rstate) throws Exception
	{
		Map map = new HashMap();
		int rowsize = 12;
		int start = (rowsize * page) - (rowsize - 1);
		int end = rowsize * page;
		map.put("start", start);
		map.put("end", end);
		map.put("rstate", rstate);
		
		List<ReserveVO> list=dao.campAdminReserveList(map);
		for(ReserveVO vo:list)
		{
			String img=vo.getImage();
			if(img.contains("^"))
			{
				img=img.substring(0,img.indexOf("^"));
				vo.setImage(img);
			}
			int price=Integer.parseInt(vo.getPrice());
			
			DecimalFormat df=new DecimalFormat("###,###,###");
			String Fprice=df.format(price);
			vo.setPrice(Fprice); 
		}
		
		int totalpage=dao.campAdminTotalpage();
		final int BLOCK = 5;
		int startpage = ((page - 1) / BLOCK * BLOCK) + 1;
		int endpage = ((page - 1) / BLOCK * BLOCK) + BLOCK;
		if(endpage>totalpage)
			endpage=totalpage;
		
		Map jmap=new HashMap();
		jmap.put("list", list);
		jmap.put("totalpage", totalpage);
		jmap.put("startpage",startpage);
		jmap.put("endpage", endpage);
		jmap.put("curpage", page);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(jmap);
	
		return json;
	}
	
	@GetMapping(value ="adminpage/camp_reserve_list.do" ,produces = "text/plain;charset=UTF-8")
	public String admin_camp_reserve_list(int page,String rstate) throws Exception
	{
		
	
		System.out.println(rstate);
		return admin_camp_reserve_list_data(page,rstate);
		
	}
	
	@GetMapping(value ="adminpage/camp_reserve_msg.do" ,produces = "text/plain;charset=UTF-8")
	public String admin_camp_reserve_list(int rno) throws Exception
	{
		
		ReserveVO vo=dao.adminReserveMsg(rno);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		
		return json;
	}
	
	@GetMapping(value ="adminpage/camp_reserve_rstate_change.do" ,produces = "text/plain;charset=UTF-8")
	public String admin_reserve_rstate_change(int page,int rno,String rstate) throws Exception
	{
		dao.rstateChange(rno);
		ReserveVO vo=dao.campReserveMail(rno);
		manager.campReserveOkMail(vo);
		return admin_camp_reserve_list_data(page,rstate);
	}
	
	//찜
	@GetMapping(value ="camp/camp_jjim_insert.do" ,produces = "text/plain;charset=UTF-8")
	public String camp_jjim_insert(int cno,String id)throws Exception
	{
		Map map=new HashMap();
		map.put("cno", cno);
		map.put("id", id);
		
		dao.campJjimInsert(map);
		
		int jjimCount=dao.campJjimCount(map);
		
		Map rmap=new HashMap();
		rmap.put("jjimCount", jjimCount);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(rmap);
	
		return json;
	}
	
	@GetMapping(value ="camp/camp_jjim_delete.do" ,produces = "text/plain;charset=UTF-8")
	public String camp_jjim_delete(int cno,String id)throws Exception
	{
		Map map=new HashMap();
		map.put("cno", cno);
		map.put("id", id);
		
		dao.campJjimDelete(map);
		
		int jjimCount=dao.campJjimCount(map);
		
		Map rmap=new HashMap();
		rmap.put("jjimCount", jjimCount);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(rmap);
	
		return json;
	}
	
	@GetMapping(value = "camp/camp_jjim_count.do",produces = "text/plain;charset=UTF-8")
	public String camp_jjim_count(int cno,String id)throws Exception
	{
		Map map=new HashMap();
		map.put("cno", cno);
		map.put("id", id);
		
		int jjimCount=dao.campJjimCount(map);
		Map rmap=new HashMap();
		rmap.put("jjimCount", jjimCount);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(rmap);
	
		return json;
	}
	
	@GetMapping(value = "mypage/camp_jjim_list.do",produces = "text/plain;charset=UTF-8")
	public String camp_mypage_jjim_list(String id)throws Exception
	{
		System.out.println(id);
		
	
		List<JjimVO> list=dao.campJjimList(id);
		for(JjimVO vo:list)
		{
			String img=vo.getImage();
			if(img.contains("^"))
			{
				img=img.substring(0,img.indexOf("^"));
				vo.setImage(img);
			}
			int price=Integer.parseInt(vo.getPrice());
			
			DecimalFormat df=new DecimalFormat("###,###,###");
			String Fprice=df.format(price);
			vo.setPrice(Fprice);
			
			String phoneNumber = vo.getPhone();
			String FphoneNumber = phoneNumber.substring(0, 3) 
								+ "-" 
								+ phoneNumber.substring(3, 7) 
								+ "-" 
								+ phoneNumber.substring(7);
			vo.setPhone(FphoneNumber);
		}
		
		
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
	
		return json;
	}
	
}
