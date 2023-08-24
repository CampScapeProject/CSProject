package com.sist.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class ReviewVO {
	private int no,sno,rating,hit;
	private String content,type,id,subject;
	private Date regdate;
	private int tCount;
	private Double tRating;
	private String dbday;
	private int totalpage,curpage;
	private int rsno;
}
