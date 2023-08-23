package com.sist.vo;

import java.util.*;
import org.springframework.web.multipart.MultipartFile;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class NoticeVO {
	private int nno, hit, fix;
	private String id, title, content, dbday;
	private Date regdate;
}
