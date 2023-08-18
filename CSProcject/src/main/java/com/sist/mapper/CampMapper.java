package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.CampVO;

public interface CampMapper {
	
	//<select id="campListData" resultType="CampVO" parameterType="hashmap">
	public List<CampVO> campListData(Map map); 
	
	//<select id="campFindData" resultType="CampVO" parameterType="hashmap">
	public List<CampVO> campFindData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM camp2")
	public int campTotalPage();
	
	
}
