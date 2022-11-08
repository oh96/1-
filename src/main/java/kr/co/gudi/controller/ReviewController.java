package kr.co.gudi.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;


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
		logger.info("글쓰기폼 이동");
		return "reviewWriteForm";
	}
	
	@RequestMapping(value="/reviewWrite")
	public String reviewWrite(Model model, HttpServletRequest req, @RequestParam HashMap<String, String> params) {
		logger.info("후기 쓰기 요청");
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("loginId");
		reviewService.reviewWrite(id, params);
		
		return "review";
	}
	
	@RequestMapping(value = "/reviewDetail")
	public String reviewDetail(Model model,
			@RequestParam String board_idx) {
		logger.info("board_idx:{}",board_idx);
		String page = "redirect:/";
		ReviewDTO dto = reviewService.reviewDetail(board_idx);
		
		if (dto != null) {
			page = "reviewDetail";
			model.addAttribute("board",dto);
		}
		return page;
	}
	
	@RequestMapping(value = "/reviewUpdateForm")
	public String reviewUpdateForm(Model model,
			@RequestParam String board_idx) {
		logger.info("board_idx:{}",board_idx);
		String page = "redirect:/";
		ReviewDTO dto = reviewService.reviewUpdateForm(board_idx);
		
		if (dto !=null) {
			page = "reviewUpdateForm";
			model.addAttribute("board",dto);
		}
		return page;	
	}
	
	@RequestMapping(value = "/reviewUpdate")
	public String reviewUpdate(@RequestParam HashMap<String, String>params) {
	logger.info("param:{}",params);
	reviewService.reviewUpdate(params);
	return "redirect:/reviewDetail?board_idx="+params.get("board_idx");
		
	}
}

