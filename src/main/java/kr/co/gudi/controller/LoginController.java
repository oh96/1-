package kr.co.gudi.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gudi.dto.UserDTO;
import kr.co.gudi.service.LoginService;

@Controller
public class LoginController {

   Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @Autowired LoginService loginService;
   
   @RequestMapping(value="/loginForm")
   public String loginForm(Model model) {
      model.addAttribute("page","로그인화면");
      return "main";
   }
   
   @RequestMapping(value="/login")
   public String login(Model model, HttpServletRequest req,@RequestParam HashMap<String, String> params) {
      logger.info("로그인 요청");
      String page = "로그인화면";
      String msg = "";
      String loginChk = loginService.loginchk(params);
      String loginStop = loginService.loginStop(params);
      
      if(params.get("id").equals("")) {
         msg = "아이디를 입력해주세요";
      }else if(params.get("password").equals("")){
         msg = "비밀번호를 입력해주세요";
      }else if(loginChk != null && !loginChk.equals("")){
         msg = "탈퇴한 회원입니다.";
      }else if(loginStop != null && !loginStop.equals("")) {
         msg = "정지된 회원입니다";
      }else {
         UserDTO userDTO = loginService.login(params);
         if(userDTO == null) {
            msg = "아이디 또는 비밀번호를 확인하세요.";
             model.addAttribute("msg", msg);
              model.addAttribute("page",page);
         }else if(userDTO != null) {
            page = "";
            HttpSession session = req.getSession();
            session.setAttribute("loginId", userDTO.getId());
            session.setAttribute("user_grade", userDTO.getUser_grade());
         }
      }
      
      model.addAttribute("msg", msg);
      model.addAttribute("page",page);
      model.addAttribute("id",params.get("id"));
      model.addAttribute("password",params.get("password"));
      
      return "main";
   }
   
   @RequestMapping(value="/logout")
   public String logout(HttpSession session) {
      logger.info("로그아웃 요청");
      session.removeAttribute("loginId");
      session.removeAttribute("user_grade");
      
      return "redirect:/";
   }
}