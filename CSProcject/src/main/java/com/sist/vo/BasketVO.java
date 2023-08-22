package com.sist.vo;
/*
 * CNO	NUMBER
SNO	NUMBER
ID	VARCHAR2(150 BYTE)
AMOUNT	NUMBER
PRICE	NUMBER
BUY_OK	NUMBER
CHECK_OK	NUMBER
REGDATE	DATE
 */

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BasketVO {

	private String id;
	private int cno,sno,amount,price,buy_ok,check_ok;
	private Date regdate;
	
}
