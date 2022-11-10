package kr.co.gudi.service;


import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.dao.RouteDAO;

@Service
public class RouteService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired RouteDAO routeDAO;
	
	public void routeWrite(String loginId, String title, String content) {
		// TODO Auto-generated method stub
		
	}

	public  HashMap<String, Object> routelist(int page) {
		logger.info("후기 리스트 호출"+page);
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int offset = (page-1)*10;
		int totalCount = routeDAO.totalCount();
		logger.info("totalCount:"+totalCount);
		int totalPages = totalCount%10 >0 ? (totalCount/10)+1 : (totalCount/10); //총 페이지 수
		//Math.ceil(totalCount/10);
		logger.info(totalPages+"");
		//reviewDAO.list();
		result.put("total", totalPages);
		result.put("routelist", routeDAO.routelist(offset));
		
		return result;
	}

	public String getDoro(Object sight1) {
		// TODO Auto-generated method stub
		return null;
	}

}

