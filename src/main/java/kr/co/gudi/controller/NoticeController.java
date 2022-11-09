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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gudi.dto.NoticeDTO;
import kr.co.gudi.dto.ReviewDTO;
import kr.co.gudi.service.NoticeService;

@Controller
public class NoticeController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Autowired NoticeService service;
	
    @RequestMapping(value = "/notice") 
    public String main() { 
       return "notice"; 
    }
   
	
	  @RequestMapping(value = "/listCall")
	  @ResponseBody 
	  public HashMap<String, Object> listCall(@RequestParam int page){ 
		  logger.info("list 요청 : "+page); 
		  HashMap<String, Object> map=new HashMap<String, Object>(); 
	  
	  return service.list(page);
	 }
	 
	  @RequestMapping(value = "/noticedetail")
		public String noticedetail(Model model,@RequestParam(value="idx", required=false) String idx) {
		  
			logger.info("board_idx = "+idx);
			service.noticedetail(idx,model,"noticedetail");
			/*String page = "redirect:/";
			idx = service.noticedetail(idx);
			// NoticeDTO dto = service.noticedetail(idx);
			
			if (idx != null) {
				page = "noticedetail";
				model.addAttribute("board",idx);
			}*/
			return "noticedetail";
		}
	  
	  @RequestMapping(value = "/admin_notice") 
	    public String admin_notice() { 
	       return "admin_notice"; 
	  }
	  
	  
	  @RequestMapping(value="/noticeWriteForm")
		public String noticeWriteForm() {
			
			return "noticeWriteForm";
		}
	  
	  @RequestMapping(value="/noticeWrite")
		public String reviewWrite(Model model, HttpServletRequest req, @RequestParam(value="id", required=false) String id,@RequestParam HashMap<String, String> params) {
			logger.info("공지 쓰기 요청");
			HttpSession session = req.getSession();
			id = (String) session.getAttribute("loginId");
			logger.info(id);
			
			service.noticeWrite(id, params);
			
			return "admin_notice";
	  }
	  
	  @RequestMapping(value="/noticeUpdateForm")
	  public String noticeUpdateForm(Model model, @RequestParam String idx) {
		  logger.info("idx = "+idx);
		  service.noticedetail(idx,model,"noticeUpdateForm");
		  return "noticeUpdateForm";
	  }
	  
	  @RequestMapping(value="/noticeupdate")
	  public String noticeupdate(Model model, @RequestParam HashMap<String, String> params,MultipartFile photo) {
		  logger.info("params : {}",params);
		  
		  return service.noticeupdate(photo,params);
	  }
	  
	  
	  
	  
	  
}




