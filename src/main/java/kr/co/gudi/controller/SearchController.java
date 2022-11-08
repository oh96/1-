package kr.co.gudi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gudi.service.SearchService;

@Controller
public class SearchController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SearchService searchService;
	
	@RequestMapping(value="/totalSearch")
	public String totalSearch(@RequestParam String searchContent) {
		logger.info("전체 검색 요청");
		logger.info(searchContent);
		
		
		
		return "search";
	}
	
}
