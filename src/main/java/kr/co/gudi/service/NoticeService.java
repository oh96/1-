package kr.co.gudi.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.dao.NoticeDAO;
import kr.co.gudi.dto.NoticeDTO;

@Service
public class NoticeService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired NoticeDAO dao;
	
	public HashMap<String, Object> list(int page){
		logger.info("공지 리스트 호출");
		return dao.list();
	}
	
	
	public HashMap<String, Object> list(int page) {
		
		int offset = (page-1)*10;
		int totalCount = dao.totalCount();
		logger.info("total count : "+totalCount);
		
		
		int totalPages=totalCount/10; 
		if(totalCount%10>0) {
			totalPages=(totalCount/10)+1;
		}
		logger.info("총 페이지 수 : "+totalPages);
		logger.info("총 페이지 수2 : "+Math.ceil(totalCount/10));
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("total", totalPages);
		result.put("list",dao.list(offset));
		
		return result;
	}

	


}
