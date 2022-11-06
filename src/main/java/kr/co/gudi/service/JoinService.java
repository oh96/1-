package kr.co.gudi.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.dao.JoinDAO;

@Service
public class JoinService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired JoinDAO dao;

	
	public int join(String id, String password, String user_name, String age, String gender, String email) {
		
		return dao.join(id, password, user_name, age, gender, email);
	}


	public boolean overlay(String id) {
		String overlayId = dao.overlay(id);
		logger.info("overlayID:"+overlayId);
		return overlayId == null ? false : true;
	}
}
