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
import org.springframework.web.multipart.MultipartFile;

import kr.co.gudi.dto.ReviewDTO;
import kr.co.gudi.service.ReviewService;

@Controller
public class ReviewController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ReviewService reviewService;
	
	@RequestMapping(value="/review")
	public String reviewList() {
		return "review";
	}
	
	@RequestMapping(value="/reviewListCall")
	@ResponseBody
	public HashMap<String, Object> reviewListCall() {
		logger.info("후기 리스트 호출");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<ReviewDTO> list = reviewService.list();
		map.put("list", list);
		
		return map;
	}
	
	@RequestMapping(value="/reviewWriteForm")
	public String reviewWriteForm() {
		
		return "reviewWriteForm";
	}
	
	@RequestMapping(value="/reviewWrite")
	public String reviewWrite(Model model, MultipartFile photo, @RequestParam HashMap<String, String> params) {
		logger.info("params : {}", params);
		logger.info("photo : {}", photo.getOriginalFilename());
		
		return "review";
	}
	
}
