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

import kr.co.gudi.service.NoticeService;
import kr.co.gudi.dto.NoticeDTO;
import kr.co.gudi.dto.PhotoNoticeDTO;
import kr.co.gudi.service.NoticeService;

@Controller
public class NoticeController {
   
    Logger logger = LoggerFactory.getLogger(this.getClass());
   
    @Autowired NoticeService service;
    
	
	@RequestMapping(value = "/notice") public String main() {
	  
	 return "notice_list"; 
	 }
 
   
   @RequestMapping(value = "/notice_list")
   @ResponseBody
   public HashMap<String, Object> list(@RequestParam int page) {
      logger.info("list요청!! : "+page);
      HashMap<String, Object> map = new HashMap<String, Object>();
    	  
      return service.list(page);
   }
   
   
   
   
   
   
   
   
   
}








/*@Controller
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
	
	 @RequestMapping(value="/notice_writeForm") public String writeForm(Model
			  model) {
			  return "notice_writeForm"; }
			  
	@RequestMapping(value="/notice_write") public String write(Model
			  model, @RequestParam HashMap<String, String> params, MultipartFile photo) {
			  logger.info("params : {}",params); 
			  return service.write(photo, params); 
			  
	}
	
	@RequestMapping(value="/notice_detail") public String detail(Model
			  model, @RequestParam String idx) { logger.info("idx = "+idx);
			  service.detail(idx,model,"detail"); 
			  
			  return "detail"; }
			  
			 } 
			 */


	
	
	
	





