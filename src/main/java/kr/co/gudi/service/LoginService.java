package kr.co.gudi.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.dao.LoginDAO;

@Service
public class LoginService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired LoginDAO loginDAO;

	public String login(HashMap<String, String> params) {
		logger.info("로그인 서비스");
		String id = params.get("id");
		String password = params.get("password");
		
		return loginDAO.login(id,password);
	}

	public String loginchk(HashMap<String, String> params) {
		logger.info("아이디 체크");
		String id = params.get("id");
		
		return loginDAO.loginchk(id);
	}
	
}
