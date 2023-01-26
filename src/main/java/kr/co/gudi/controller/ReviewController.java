package kr.co.gudi.controller;

import java.util.HashMap;
import java.util.Map;

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

import kr.co.gudi.dto.BoardDTO;
import kr.co.gudi.dto.LocateDTO;
import kr.co.gudi.dto.ReviewDTO;
import kr.co.gudi.service.ReviewService;

@Controller
public class ReviewController {

   

   Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @Autowired ReviewService reviewService;
   
   /*
    * @RequestMapping(value="/review") public String reviewList() { return
    * "review"; }
    */
   
   @RequestMapping(value="/reviewListCall")
   @ResponseBody
   public HashMap<String, Object> reviewListCall(@RequestParam int page) {
      logger.info("후기 리스트 호출"+page);
      
      
      return reviewService.list(page);
   }
   
   
   
   @RequestMapping(value = "/reviewDetail")
   public String reviewDetail(Model model,
         @RequestParam String board_idx) {
      logger.info("board_idx:{}",board_idx);
      
      
      BoardDTO dto = reviewService.reviewDetail(board_idx);
      String loc_idx1 = reviewService.getLoc(board_idx);
      String loc_Name = reviewService.getLocName(loc_idx1);
      logger.info(loc_idx1);
      logger.info(board_idx);
      String page = null;
      page = "후기상세보기";
      if (dto != null) {
         model.addAttribute("board",dto);
         model.addAttribute("loc_idx",loc_idx1);
         model.addAttribute("loc_Name", loc_Name);
         model.addAttribute("page",page);
      }
      return "main";
   }
	/*
	 * @RequestMapping(value="/reviewWriteForm") public String reviewWriteForm(Model
	 * model, HttpSession session) { String page = "후기글쓰기"; if
	 * (session.getAttribute("loginId") != null) { logger.info("글쓰기폼 이동"); }else {
	 * model.addAttribute("msg","로그인이 필요한 서비스 입니다"); page="로그인화면"; }
	 * model.addAttribute("page", page); return page; }
	 */
   
   @RequestMapping(value="/reviewWrite")
   @ResponseBody
   public HashMap<String, Object> reviewWrite(Model model, 
         HttpServletRequest req, 
         @RequestParam String subject, 
         @RequestParam String content, 
         @RequestParam String loc_idx) {
      HashMap<String, Object>map = new HashMap<String, Object>();
      logger.info("후기 쓰기 요청");
      logger.info(subject+"/"+content+"/"+loc_idx);
      //logger.info(params.get("basic").getClass().getName());
      HttpSession session = req.getSession();
      String id = (String) session.getAttribute("loginId");
      reviewService.reviewWrite(id, subject, content, loc_idx);
      
      return map;
   }
   @RequestMapping(value = "/reviewUpdateForm")
   public String reviewUpdateForm(Model model,
         @RequestParam String board_idx) {
      logger.info("board_idx:{}",board_idx);
      
      BoardDTO dto = reviewService.reviewUpdateForm(board_idx);
      String loc_idx1 = reviewService.getLoc(board_idx);
      String loc_Name = reviewService.getLocName(loc_idx1);
      logger.info(loc_idx1);
      logger.info(board_idx);
      logger.info("후기 글쓰기수정 이동");
      
      String page = null;
      page = "후기글수정";
      if (dto !=null) {
         model.addAttribute("board",dto);
         model.addAttribute("loc_idx",loc_idx1);
         model.addAttribute("loc_Name", loc_Name);
         model.addAttribute("page",page);
      }
      return "main";   
   }
   
   @RequestMapping(value = "/reviewUpdate")
   public String reviewUpdate(@RequestParam HashMap<String, String>params) {
   logger.info("param:{}",params);
   //reviewService.reviewUpdate(params);
   String board_idx = params.get("board_idx");
   String board_subject = params.get("board_subject");
   String board_content = params.get("board_content");
   String loc_idx = params.get("loc_idx");
   
   reviewService.reviewLocUpdate(board_idx,loc_idx);
   reviewService.reviewUpdate(board_idx,board_subject,board_content);
    
   return "redirect:/reviewDetail?board_idx="+params.get("board_idx");
      
   }
   
   @RequestMapping(value = "/reviewDelete")
   public String reviewDelete( Model model,
         @RequestParam String board_idx) {
      logger.info("삭제 요청"+board_idx);
      reviewService.reviewLocDelete(board_idx);
      reviewService.reviewDelete(board_idx);
      
      String page = "여행지후기";
   
      model.addAttribute("page",page);
      return "main";
   }
   
   @RequestMapping(value="/reviewListPopup")
      public String reviewListPopup() {
         return "reviewListPopup";
   }
   
   @RequestMapping(value = "/reviewListPop")
      @ResponseBody
      public Map<String, Object> reviewListPop(@RequestParam int page){
         logger.info("리스트 요청: "+page);

         return reviewService.reviewListPop(page);
   }
   
   @RequestMapping(value="/reviewsearchPlace", method=RequestMethod.GET)
      @ResponseBody
      public HashMap<String, Object> reviewsearchPlace(HttpServletRequest req) {
         
         // List<LocateDTO> locateList = new ArrayList<LocateDTO>();
         String keyword = req.getParameter("keyword");
         logger.info(keyword);
         HashMap<String, Object> map = new HashMap<String, Object>();
         map.put("list", reviewService.reviewsearchPlace(keyword));
         
         return map;
     }
}
