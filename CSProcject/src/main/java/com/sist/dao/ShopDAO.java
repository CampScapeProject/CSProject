package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.ShopMapper;
import com.sist.vo.BasketVO;
import com.sist.vo.OrderVO;
import com.sist.vo.ShopCategoryVO;
import com.sist.vo.ShopVO;

@Repository
public class ShopDAO {

	@Autowired
	private ShopMapper mapper;
	
//	@Select("SELECT * FROM shop2")
	public List<ShopVO> shopAllList() {
		return mapper.shopAllList();
	}
	
//	@Select("SELECT * FROM category_shop2")
	public List<ShopCategoryVO> shopCateList() {
		return mapper.shopCateList();
	}
	
//	@Select("SELECT * FROM shop2 "
//			+ "WHERE sno=#{sno}")
	public ShopVO shopDetailList(int sno) {
		return mapper.shopDetailList(sno);
	}
	
//	@Select("SELECT image, name, price, sno "
//			+ "FROM (SELECT image, name, price, sno, ROWNUM AS row_num "
//			+ "FROM shop2) "
//			+ "WHERE row_num BETWEEN 2 AND 4")
	public List<ShopVO> shopRecomProduct(Map map) {
		return mapper.shopRecomProduct(map);
	}
	
	// 페이지
	@Select("SELCET COUNT(*) FROM shop2")
	public int shopRowCount() {
		return mapper.shopRowCount();
	}
	
//	@Select("SELECT CEIL(COUNT(*)/12.0) FROM shop2 WHERE cateno=#{cateno}")
	public int shopTotalPage(int cateno) {
		return mapper.shopTotalPage(cateno);
	}
	
//	@Select("SELECT sno,image,brand,name,price,detail_image,cateno,num "
//			+ "FROM (SELECT sno,image,brand,name,price,detail_image,cateno,rownum as num "
//			+ "FROM (SELECT /*+INDEX_ASC(S2_SNO_PK)*/ sno,image,brand,name,price,detail_image,cateno "
//			+ "FROM shop2 WHERE cateno=#{cateno})) WHERE num BETWEEN #{start} AND #{end}")
	public List<ShopVO> shopCateDetailList(Map map) {
		return mapper.shopCateDetailList(map);
	}
	
//	@Insert("INSERT INTO order2 (ono,sno,id,amount,price) "
//			+ "VALUES(od2_ono_seq.nextval,#{sno},#{id},#{amount},#{price})")
	public void shopPay(OrderVO vo) {
		mapper.shopPay(vo);
	}
	
//	@Insert("INSERT INTO campbasket (cateno,sno,id,amount,price) "
//			+ "VALUES(cb_cateno_seq.nextval,#{sno},#{id},#{amount},#{price})")
	public void shopBasket(BasketVO vo) {
		mapper.shopBasket(vo);
	}
	
//	@Select("SELECT * FROM campbasket WHERE id=#{id}")
	public List<BasketVO> basketList(String id){
		return mapper.basketList(id);
	}
	
//	@Delete("DELETE FROM campbasket WHERE id=#{id} and cateno=#{cateno}")
	public void basketDelete(Map map) {
		mapper.basketDelete(map);
	}
	
//	@Select("SELECT * FROM shop2 s "
//			+ "JOIN campbasket c ON c.#{sno} = s.#{sno} "
//			+ "WHERE c.{sno} = #{sno}")
	public List<ShopVO> basketDetail(String id) {
		return mapper.basketDetail(id);
	}
	
//	@Update("UPDATE campbasket SET buy_ok=1 WHERE cno=#{cno}")
	public void shopBasket_pay(int cno) {
		mapper.shopBasket_pay(cno);
	}
	
}
