package com.sist.rest;

import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class NoticeRestController {
	
	@Autowired
	private NoticeDAO dao;
	
	
}
