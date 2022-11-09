package kr.co.gudi.service;

<<<<<<< HEAD
=======
import java.util.HashMap;

>>>>>>> origin/master
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.dao.RouteDAO;

@Service
public class RouteService {
<<<<<<< HEAD

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired RouteDAO routeDAO;

	public String getDoro(Object sight1) {
		
		return routeDAO.getDoro(sight1);
	}

	public void routeWrite(String loginId, String title, String content) {
		int WriteOK = routeDAO.routeWrite(loginId, title, content);
		
	}


	
	
	
=======
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired RouteDAO routeDAO;
	
	public HashMap<String, Object> routelist(int page) {
		logger.info("경로 리스트 호출"+page);
		HashMap<String, Object>result = new HashMap<String, Object>();
		
		int offset = (page-1)*10;
		int totalCount = routeDAO.totalCount1();
		logger.info("totalCount:"+totalCount);
		int totalPages = totalCount%10 > 0? (totalCount/10)+1 : (totalCount/10); //총 페이지 수
		logger.info(totalPages+"");
		result.put("total", totalPages);
		result.put("routelist", routeDAO.routelist(offset));
		return result;
	}

>>>>>>> origin/master
}
