package kr.co.gudi.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.dao.RouteDAO;

@Service
public class RouteService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired RouteDAO routeDAO;

	public String getDoro(Object sight1) {
		
		return routeDAO.getDoro(sight1);
	}

	public void routeWrite(String loginId, String title, String content) {
		int WriteOK = routeDAO.routeWrite(loginId, title, content);
		
	}


	
	
	
}
