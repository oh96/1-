package kr.co.gudi.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.dao.JoinDAO;

@Service
public class JoinService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired JoinDAO joinDAO;

	public void join(HashMap<String, String> params) {
		logger.info("회원가입 서비스");
		String id = params.get("id");
		String password = params.get("password");
		String user_name = params.get("user_name");
		String age = params.get("age");
		String gender = params.get("gender");
		String email = params.get("email");
		
		joinDAO.join(id, password, user_name, age, gender, email);
	}
}
