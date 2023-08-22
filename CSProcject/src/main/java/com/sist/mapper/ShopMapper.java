package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.BasketVO;
import com.sist.vo.OrderVO;
import com.sist.vo.ShopCategoryVO;
import com.sist.vo.ShopVO;

public interface ShopMapper {

	@Select("SELECT * FROM shop2 WHERE sno BETWEEN 1 AND 6")
	public List<ShopVO> shopAllList();
	
	@Select("SELECT * FROM category_shop2")
	public List<ShopCategoryVO> shopCateList();

	@Select("SELECT * FROM shop2 "
			+ "WHERE sno=#{sno}")
	public ShopVO shopDetailList(int sno);
	
	// 페이지
	@Select("SELCET COUNT(*) FROM shop2")
	public int shopRowCount();
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM shop2 WHERE cno=#{cno}")
	public int shopTotalPage(int cno);
	
	@Select("SELECT sno,image,brand,name,price,detail_image,cno,num "
			+ "FROM (SELECT sno,image,brand,name,price,detail_image,cno,rownum as num "
			+ "FROM (SELECT /*+INDEX_ASC(S2_SNO_PK)*/ sno,image,brand,name,price,detail_image,cno "
			+ "FROM shop2 WHERE cno=#{cno})) WHERE num BETWEEN #{start} AND #{end}")
	public List<ShopVO> shopCateDetailList(Map map);
	
	@Insert("INSERT INTO order2 (ono,sno,id,amount,price) "
			+ "VALUES(od2_ono_seq.nextval,#{sno},#{id},#{amount},#{price})")
	public void shopPay(OrderVO vo);
	
	// 장바구니 넣기
	@Insert("INSERT INTO campbasket (cno,sno,id,amount,price) "
			+ "VALUES(cb_cno_seq.nextval,#{sno},#{id},#{amount},#{price})")
	public void shopBasket(BasketVO vo);
	
	@Select("SELECT * FROM campbasket WHERE id=#{id}")
	public List<BasketVO> basketList(String id);
	
	@Delete("DELETE FROM campbasket WHERE id=#{id} and cno=#{cno}")
	public void basketDelete(Map map);
}
