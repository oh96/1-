package kr.co.gudi.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gudi.service.RouteService;

@Controller
public class RouteController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired RouteService routeService;
	
	
	@RequestMapping(value = "/routeListCall")
	@ResponseBody
	public HashMap<String, Object> routeListCall(@RequestParam int page){
		logger.info("경로 리스트 호출"+page);
		
		
		return routeService.routelist(page);
	}
	
	
	
	
}
