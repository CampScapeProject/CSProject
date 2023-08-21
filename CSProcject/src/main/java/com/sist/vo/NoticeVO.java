package com.sist.vo;

import java.util.*;
import org.springframework.web.multipart.MultipartFile;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class NoticeVO {
	private int nno, hit, filecount;
	private String id, title, dbday, filename, filesize;
	private Date regdate;
	private List<MultipartFile> files; // 업로드된 파일 저장
}
