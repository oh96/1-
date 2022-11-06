package kr.co.gudi.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gudi.dto.NoticeDTO;
import kr.co.gudi.service.NoticeService;

@Controller
public class NoticeController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Autowired NoticeService service;
	
	
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String main(Model model) {
		logger.info("리스트호출");
		
		ArrayList<NoticeDTO> list = service.list();
		logger.info("list size :"+list.size());
		model.addAttribute("list",list);
		return "notice_list";
	}
	
	
	
	
	
	
}




