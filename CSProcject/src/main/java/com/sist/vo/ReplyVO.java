package com.sist.vo;

import java.util.*;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ReplyVO {
	private int rpno, rno, group_id, group_step, root, depth;
	private String id, msg, dbday, nickname;
	private Date regdate;
}
