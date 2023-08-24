package com.sist.vo;

import java.util.*;
import org.springframework.web.multipart.MultipartFile;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class NoticeVO {
	private int nno, hit, fix, filecount;
	private String id, title, content, dbday, filename, filesize;
	private Date regdate; 
	private List<MultipartFile> images;
}
