package kr.co.gudi.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String login(Model model, HttpServletRequest req,@RequestParam HashMap<String, String> params) {
		logger.info("로그인 요청");
		String page = "home";
		String msg = "아이디 혹은 비밀번호를 확인해주세요.";
		//logger.info(params+"");
		String loginId = loginService.login(params);
		
		if(loginId!=null && !loginId.equals("")) {
			HttpSession session = req.getSession();
			session.setAttribute("loginId", loginId);
		}else {
			page="loginForm";
			model.addAttribute("msg", msg);
		}
		
		return page;
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		logger.info("로그아웃 요청");
		session.removeAttribute("loginId");
		
		return "redirect:/";
	}
}
