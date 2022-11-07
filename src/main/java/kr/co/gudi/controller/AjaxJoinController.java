package kr.co.gudi.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gudi.service.JoinService;

@Controller
public class AjaxJoinController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired JoinService service;
	
	@RequestMapping(value = "/overlay")
	@ResponseBody
	public HashMap<String, Object> overlay(@RequestParam String id) {
		boolean overaly = true;
		logger.info("아이디 중복체크:"+id);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		overaly = service.overlay(id);
		
		map.put("overlay", overaly);
		
		return map;
		
	}
	
	@RequestMapping(value = "/ajaxJoin")
	@ResponseBody
	public HashMap<String, Object> ajaxJoin(
			@RequestParam HashMap<String,String> params) {
		
		logger.info("params:{}",params);
		String id = params.get("id");
		String pw = params.get("pw");
		String name = params.get("name");
		String age = params.get("age");
		String gender = params.get("gender");
		String email = params.get("email");
		int row = service.join(id,pw,name,age,gender,email);
		
		HashMap<String, Object>map = new HashMap<String, Object>();
		
		
		map.put("success", row);
		
		return map;
		
	}
	
	
		

	
	
	
}
