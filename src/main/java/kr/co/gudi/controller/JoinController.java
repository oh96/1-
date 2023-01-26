package kr.co.gudi.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.gudi.service.JoinService;

@Controller
public class JoinController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired JoinService joinService;
	
	@RequestMapping(value="joinForm")
	public String joinForm(Model model) {
		
		model.addAttribute("page","회원가입");
		return "main";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Model model, HttpServletRequest req) {
		
		String page = "join";
		String msg = "회원가입에 실패 했습니다";
		String id = req.getParameter("id");
		String pw = req.getParameter("password");
		String name = req.getParameter("user_name");
		String age = req.getParameter("age");
		String gender = req.getParameter("gender");
		String email = req.getParameter("email");
		
		logger.info(id+"/"+pw+"/"+name+"/"+age+"/"+gender+"/"+email);
		
		try {
			int row = joinService.join(id,pw,name,age,gender,email);	
			if(row==1) {
				page = "home";
				msg = "회원가입에 성공했습니다";	
			}
			
		} catch (Exception e) {
			msg ="중복된 아이디 입니다";
		}
		model.addAttribute("msg",msg);
		
		return page;
	}
}
