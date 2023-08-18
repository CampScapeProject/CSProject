package com.sist.vo;

/*
	qno NUMBER,
    qcno NUMBER,
    id VARCHAR2(50),
    name VARCHAR2(51),
    title VARCHAR2(1000),
    content CLOB CONSTRAINT qna2_content_nn NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    hit NUMBER DEFAULT 0,
    open VARCHAR2(5) CONSTRAINT qna2_open_nn NOT NULL,
    group_id NUMBER,
    group_step NUMBER DEFAULT 0,
    group_tab NUMBER DEFAULT 0,
    root NUMBER DEFAULT 0,
    depth NUMBER DEFAULT 0
 */
import java.util.*;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class QnaVO {
	private int qno, qcno, hit, group_id, group_step, group_tab, root, depth;
	private String id, name, title, content, dbday, open;
	private Date regdata;
}
