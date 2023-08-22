package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class RentVO {
	private int rno,price;
	private String image,car_name,car_type,maker,inwon,fuel,car_option;
	private String date;
	private int rvCount,jjimCount,jjimOk;
	private Double rvAvg;
}
