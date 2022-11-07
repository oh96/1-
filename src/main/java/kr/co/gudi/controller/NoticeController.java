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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gudi.dto.NoticeDTO;
import kr.co.gudi.service.NoticeService;

@Controller
public class NoticeController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Autowired NoticeService service;
	
    @RequestMapping(value = "/list") 
    public String main() { 
       return "notice"; 
    }
   
   @RequestMapping(value = "/listCall")
   @ResponseBody
   public HashMap<String, Object> listCall(@RequestParam int page) {
      logger.info("list 요청 : "+page);
      HashMap<String, Object> map=new HashMap<String, Object>();
      return service.list(page);
   }
	
	
	
	
	
	
}




