package kr.co.gudi.controller;

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

import kr.co.gudi.dto.MypageDTO;
import kr.co.gudi.service.MyPageService;
import kr.co.gudi.service.UserPageService;

@Controller
public class UserPageController {

   Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @Autowired UserPageService userPageService;
   @Autowired MyPageService mypageservice;
   
   @RequestMapping(value="/userPageReviewListCall")
   public String userPageReviewListCall(@RequestParam String userId,Model model,HttpServletRequest req) {
      HttpSession session = req.getSession();
      String loginId = (String) session.getAttribute("loginId");
         
      String page = "유저후기글리스트";
      logger.info("userPageReviewListCall");
      logger.info("loginId: "+loginId+" / userId: "+userId);
         
      MypageDTO mypageDTO= new MypageDTO();
      mypageDTO = mypageservice.detail(userId);
      logger.info("확인1:"+mypageDTO);
         
      if(mypageDTO !=null) {
         model.addAttribute("detail",mypageDTO);
      }else {
         model.addAttribute("msg","데이터를 가져오는데 실패");
      }
         
      
      if(Integer.parseInt(mypageDTO.getUser_grade()) >= 1) {
         page="유저리스트";
      }

      if(userId.equals(loginId)) {
         page = "마이페이지상세보기";
      }
         
      model.addAttribute("userId",userId);
      model.addAttribute("loginId",loginId);
      model.addAttribute("page",page);
         
      return "main";
   }
      
   @RequestMapping(value="/userPageReviewList")
   @ResponseBody
   public HashMap<String, Object> MypageCommentList(@RequestParam String userId,@RequestParam int page){
         
      return userPageService.userPageReviewList(userId,page);
   }
      
      
      
      
   @RequestMapping(value="/userPageRouteListCall")
   public String userPageRouteListCall(@RequestParam String userId,Model model,HttpServletRequest req) {
      logger.info("userPageRouteListCall");
      logger.info("userId: "+userId);
      model.addAttribute("userId",userId);
      model.addAttribute("page","유저경로글리스트");

      return "main";
   }
      
   @RequestMapping(value="/userPageRouteList")
   @ResponseBody
   public HashMap<String, Object> userPageRouteList(@RequestParam String userId, @RequestParam int page){
         
      return userPageService.userPageRouteList(userId,page);
   }
      
      
      
   @RequestMapping(value="/userPageCommentListCall")
   public String MypageReplyListBrigde(@RequestParam String userId,Model model) {
      logger.info("userPageCommentListCall");
      logger.info("userId: "+userId);
      model.addAttribute("userId",userId);
      model.addAttribute("page","유저댓글리스트");
         
      return "main";
   }
      
   @RequestMapping(value="/userPageCommentList")
   @ResponseBody
   public HashMap<String, Object> userPageCommentList(@RequestParam String userId,@RequestParam int page){
         
      return userPageService.userPageCommentList(userId,page);
   }
   
}