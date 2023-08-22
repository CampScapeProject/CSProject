package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
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
	
	// 페이지
	@Select("SELCET COUNT(*) FROM shop2")
	public int shopRowCount() {
		return mapper.shopRowCount();
	}
	
//	@Select("SELECT CEIL(COUNT(*)/12.0) FROM shop2")
	public int shopTotalPage(int cno) {
		return mapper.shopTotalPage(cno);
	}
	
//	@Select("SELECT sno,image,brand,name,price,detail_image,cno,num "
//			+ "FROM (SELECT sno,image,brand,name,price,detail_image,cno,rownum as num "
//			+ "FROM (SELECT /*+INDEX_ASC(S2_SNO_PK)*/ sno,image,brand,name,price,detail_image,cno "
//			+ "FROM shop2 WHERE cno=#{cno})) WHERE num BETWEEN #{start} AND #{end}")
	public List<ShopVO> shopCateDetailList(Map map) {
		return mapper.shopCateDetailList(map);
	}
	
//	@Insert("INSERT INTO order2 (ono,sno,id,amount,price) "
//			+ "VALUES(od2_ono_seq.nextval,#{sno},#{id},#{amount},#{price})")
	public void shopPay(OrderVO vo) {
		mapper.shopPay(vo);
	}
	
//	@Insert("INSERT INTO campbasket (cno,sno,id,amount,price) "
//			+ "VALUES(cb_cno_seq.nextval,#{sno},#{id},#{amount},#{price})")
	public void shopBasket(BasketVO vo) {
		mapper.shopBasket(vo);
	}
	
//	@Select("SELECT * FROM campbasket WHERE id=#{id}")
	public List<BasketVO> basketList(String id){
		return mapper.basketList(id);
	}
	
//	@Delete("DELETE FROM campbasket WHERE id=#{id} and cno=#{cno}")
	public void basketDelete(Map map) {
		mapper.basketDelete(map);
}
}
