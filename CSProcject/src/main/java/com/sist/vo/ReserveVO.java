package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class ReserveVO {
	private int rno,inwon,fno,csno;
	private String name,price,rstate,dbsdate,dbedate,dbdate,type,id,phone,email,birth;
	private Date sdate,edate,regdate; 
	private String image,car_name,msg,campsite_name,camp_name;
	private int reviewok;
}
  