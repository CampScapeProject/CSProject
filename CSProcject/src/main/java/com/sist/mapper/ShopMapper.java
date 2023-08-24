package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	
	@Select("SELECT image, name, price, sno "
			+ "FROM (SELECT image, name, price, sno, ROWNUM AS row_num "
			+ "FROM shop2) "
			+ "WHERE row_num BETWEEN #{start} AND #{end}")
	public List<ShopVO> shopRecomProduct(Map map); 
			
	// 페이지
	@Select("SELCET COUNT(*) FROM shop2")
	public int shopRowCount();
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM shop2 WHERE cateno=#{cateno}")
	public int shopTotalPage(int cateno);
	
	@Select("SELECT sno,image,brand,name,price,detail_image,cateno,num "
			+ "FROM (SELECT sno,image,brand,name,price,detail_image,cateno,rownum as num "
			+ "FROM (SELECT /*+INDEX_ASC(S2_SNO_PK)*/ sno,image,brand,name,price,detail_image,cateno "
			+ "FROM shop2 WHERE cateno=#{cateno})) WHERE num BETWEEN #{start} AND #{end}")
	public List<ShopVO> shopCateDetailList(Map map);
	
	@Insert("INSERT INTO order2 (ono,sno,id,amount,price,buy_ok) "
			+ "VALUES(od2_ono_seq.nextval,#{sno},#{id},#{amount},#{price},1)")
	public void shopPay(OrderVO vo);
	
	// 장바구니 넣기
	@Insert("INSERT INTO campbasket (cno,sno,id,amount,price) "
			+ "VALUES(cb_cno_seq.nextval,#{sno},#{id},#{amount},#{price})")
	public void shopBasket(BasketVO vo);
	
	// 장바구니에서 구매하기
	@Update("UPDATE campbasket SET buy_ok=1 WHERE cno=#{cno}")
	public void shopBasket_pay(int cno);
	
	@Select("SELECT * FROM campbasket WHERE id=#{id}")
	public List<BasketVO> basketList(String id);
	
	@Delete("DELETE FROM campbasket WHERE id=#{id} and cno=#{cno}")
	public void basketDelete(Map map);
	
	@Select("SELECT * FROM shop2 s "
	        + "JOIN campbasket c ON c.sno = s.sno "
	        + "WHERE c.id=#{id} AND buy_ok=0")
	public List<ShopVO> basketDetail(String id);
	
	
	
}
