package kr.co.gudi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.gudi.service.LoginService;

@Controller
public class LoginController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired LoginService loginService;
	
	@RequestMapping(value="/loginForm")
	public String loginForm() {
		return "loginForm";
	}
	
	@RequestMapping(value="/login")
	public String login() {
		
		return "main";
	}
}
