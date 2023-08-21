package com.sist.vo;
/*
 * ONO	NUMBER
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
public class OrderVO {

	private String id;
	private int ono,sno,amount,price,buy_ok,check_ok;
	private Date regdate;
	
}
