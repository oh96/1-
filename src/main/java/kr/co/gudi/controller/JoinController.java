package kr.co.gudi.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gudi.service.JoinService;

@Controller
public class JoinController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired JoinService joinService;
	
	@RequestMapping(value="joinForm")
	public String joinForm() {
		
		return "joinForm";
	}
	
	@RequestMapping(value="join")
	public String join(Model model, @RequestParam HashMap<String, String> params) {
		//logger.info("회원가입 요청");
		logger.info(""+params);
		joinService.join(params);
		
		return "home";
	}
}
