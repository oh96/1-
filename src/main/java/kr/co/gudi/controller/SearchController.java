package kr.co.gudi.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.swing.plaf.basic.BasicSplitPaneUI.KeyboardDownRightHandler;

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
		model.addAttribute("searchContent", searchContent);
		
		return "search";
	}
	
	@RequestMapping(value="/searchListCall")
	@ResponseBody
	public HashMap<String, Object> searchListCall(@RequestParam String searchContent) {
		logger.info("전체 검색 요청");
		logger.info(searchContent);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<BoardDTO> searchList = searchService.searchList(searchContent);
		map.put("searchList", searchList);
		
		return map;
	}
	
}
