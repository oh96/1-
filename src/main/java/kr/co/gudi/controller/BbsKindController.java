package kr.co.gudi.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gudi.service.BbsKindService;

@Controller
public class BbsKindController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BbsKindService bbsKindService;
	
	@RequestMapping(value="/bbs_kind")
	@ResponseBody
	public HashMap<String, Object> bbs_kind(@RequestParam String kind){
		logger.info("카테고리 변경 요청");
		HashMap<String, Object> map = new HashMap<String, Object>();
		//logger.info(kind);
		
		return map;
	}
}
