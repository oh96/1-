package kr.co.gudi.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gudi.dto.BoardDTO;
import kr.co.gudi.service.SearchService;

@Controller
public class SearchController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SearchService searchService;
	
	@RequestMapping(value="/totalSearch")
	public String totalSearch(Model model, @RequestParam String searchContent) {
		logger.info("전체 검색 페이지 요청");
		logger.info(searchContent);
		//model.addAttribute("searchContent", searchContent);
		String page = "검색";
		return "redirect:/whatPage?page="+page;
	}
	
	@RequestMapping(value="/searchListCall")
	@ResponseBody
	public HashMap<String, Object> searchListCall(@RequestParam String searchContent, @RequestParam int page) {
		logger.info("전체 검색 요청");
		logger.info(searchContent);
		//HashMap<String, Object> map = new HashMap<String, Object>();
		//ArrayList<BoardDTO> searchList = searchService.searchList(searchContent, page);
		//logger.info(searchList+"");
		//map.put("searchList", searchList);
		
		return searchService.searchList(searchContent, page);
	}
	
	@RequestMapping(value="/SearchGo")
	public String SearchGo(Model model, @RequestParam String searchContent) {
		logger.info("전체 검색 페이지 요청");
		logger.info(searchContent);
		//model.addAttribute("searchContent", searchContent);
		String page = "검색";
		model.addAttribute("page", page);
		model.addAttribute("searchContent", searchContent);
		
		return "main";
	}
	
	@RequestMapping(value="/detailSearch")
	@ResponseBody
	public HashMap<String, Object> detailSearch(@RequestParam String detailContent, @RequestParam String sl1, 
			@RequestParam String sl2, @RequestParam int page) {
		logger.info("상세 검색 요청");
		//logger.info(detailContent);
		//logger.info(sl1);
		//logger.info(sl2);
		//logger.info(page+"");
		
		return searchService.detailSearch(detailContent,sl1,sl2,page);
	}
	
}
