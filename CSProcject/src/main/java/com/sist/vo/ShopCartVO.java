package com.sist.vo;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

/*
	 * ONO      NOT NULL NUMBER        
	SNO               NUMBER        
	ID                VARCHAR2(150) 
	AMOUNT            NUMBER        
	PRICE             NUMBER        
	BUY_OK            NUMBER        
	CHECK_OK          NUMBER        
	REGDATE           DATE       
 */

@Getter
@Setter
public class ShopCartVO {

	private String id;
	private int ono,sno,amount,price,buy_ok,check_ok;
	private Date regdate;
	
}
