package com.sist.vo;

import java.util.*;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CommentVO {
	private int cmno, rno;
	private String id, nickname, msg, dbday;
	private Date regdate;
}
