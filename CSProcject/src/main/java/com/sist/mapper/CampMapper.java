package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.CampVO;
import com.sist.vo.TourVO;

public interface CampMapper {
	
	@Select("SELECT cno,name,(SELECT MIN(TO_NUMBER(price)) FROM campsite2 cs WHERE cs.cno = c.cno) as mprice,image " 
			+"FROM camp2 c " 
			+"ORDER BY hit ASC " 
			+"FETCH FIRST 6 ROWS ONLY")
	public List<CampVO> campMainList();
	
	//<select id="campListData" resultType="CampVO" parameterType="hashmap">
	public List<CampVO> campListData(Map map); 
	
	//<select id="campFindData" resultType="CampVO" parameterType="hashmap">
	public List<CampVO> campFindData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM camp2")
	public int campTotalPage();
	
	@Update("UPDATE camp2 SET hit=hit+1 WHERE cno=#{cno} ")
	public void campHitUpdate(int cno);
	
	@Select("SELECT cno,name,address,phone,msg,image,(SELECT MIN(TO_NUMBER(price)) FROM campsite2 cs WHERE cs.cno=c.cno) as mprice FROM camp2 c WHERE cno=#{cno}")
	public CampVO campDetail(int cno);
	
	@Select("SELECT name FROM camp2 WHERE cno=#{cno}")
	public String campName(int cno);
	
	/*
	 * <select id="tourListData" resultType="CampVO" parameterType="hashmap"> SELECT
	 * tno,name,address,link,image,num FROM (SELECT
	 * tno,name,address,link,image,rownum as num FROM (SELECT
	 * tno,name,address,link,image FROM tour2 WHERE address LIKE '%'||#{addr}||'%'
	 * ORDER BY tno ASC)) WHERE num BETWEEN #{start} AND #{end} </select>
	 */
	public List<TourVO> tourListData(String addr);
}
