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

import kr.co.gudi.service.UserGradeService;

@Controller
public class UserGradeController {

   Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @Autowired UserGradeService userGradeService;
   
   @RequestMapping(value="/userGradePopup")
   public String userGradePopup(@RequestParam String userId, Model model,HttpServletRequest req) {
      logger.info(userId);
      model.addAttribute("userId",userId);
      
      HttpSession session = req.getSession();
      int loginUserGrade = (int) session.getAttribute("user_grade");
      
      HashMap<String, Object> map = userGradeService.userGradePopup(userId);
      
      String userState = (String) map.get("user_state");
      String userGrade = String.valueOf(map.get("user_grade"));
      logger.info(userGrade);
      model.addAttribute("userState",userState);
      model.addAttribute("userGrade",userGrade);
      model.addAttribute("loginUserGrade",loginUserGrade);
      
      return "userGradePopup";
   }
   
   
   
   
   @RequestMapping(value="/userGradeUpdate")
   public String userGradeUpdate(HttpServletRequest req, @RequestParam String userId, @RequestParam String gradeState) {
      logger.info("상태변경 팝업 컨트롤러");
      logger.info("userId: "+userId);
      logger.info("UserGrade: "+gradeState);
      
      userGradeService.userGradeUpdate(userId,gradeState);
      
      return "userGradePopupAlert";
   }
   
   
}