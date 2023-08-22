package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class ReserveVO {
	private int rno,inwon,fno;
	private String name,price,rstate,dbsdate,dbedate,type,id,phone,email,birth;
	private Date sdate,edate;
}
