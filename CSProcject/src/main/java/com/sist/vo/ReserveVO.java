package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class ReserveVO {
	private int rno,inwon,fno;
	private String name,price,rstate,dbsdate,dbedate,dbdate,type,id,phone,email,birth,image;
	private Date sdate,edate,regdate; 
}
