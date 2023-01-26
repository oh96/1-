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

import kr.co.gudi.dto.MypageDTO;
import kr.co.gudi.service.MyPageService;

@Controller
public class MyPageController {
   
   Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @Autowired MyPageService mypageservice;
   
      
   @RequestMapping(value="/MypageDetail")
   public String MypageDetail(Model model,HttpSession session, @RequestParam String id) {
      logger.info("마이페이지 호출:" +id);
      //String page = "mypage_detail";
      String page = null;
      
      
      if(session.getAttribute("loginId") != null) {
      
         MypageDTO dto= new MypageDTO();
         dto = mypageservice.detail(id);
         logger.info("확인1:"+dto);
         
         page="마이페이지상세보기";
         model.addAttribute("page",page);
         
         if(dto !=null) {
            model.addAttribute("detail",dto);
         }else {
            model.addAttribute("msg","데이터를 가져오는데 실패");
         }

         if (Integer.parseInt(dto.getUser_grade()) >= 1){
            page="관리자내정보";
            model.addAttribute("page",page); 
         }
      }else {
         model.addAttribute("msg","로그인 하세요");
         page="로그인화면";
         model.addAttribute("page",page);
         //page="loginForm";
      }
      
      return "main";
   }
   
   @RequestMapping(value="/MypageUpdateForm")
   public String MypageUpdateForm(Model model,@RequestParam String id) {
      logger.info("업데이트폼으로 이동완료");
      
      String page="마이페이지수정";
      
      MypageDTO info = mypageservice.detail(id);
      model.addAttribute("info",info);
      model.addAttribute("page",page);
      
      return "main";
      
   }
   
   @RequestMapping(value="/MypageUpdate")
   public String MypageUpdate(@RequestParam HashMap<String, String> params,HttpServletRequest req,Model model) {
      logger.info("마이업데이트으로 이동완료");
      logger.info("params:{}",params);
      //String page = "mypage_updateForm";
      //String page="마이페이지상세보기";
      //model.addAttribute("page",page);
      
      HttpSession session = req.getSession();
      String id = (String) session.getAttribute("loginId");
      
      String user_name=req.getParameter("user_name");
      String gender=req.getParameter("gender");
      String age=req.getParameter("age");
      String email=req.getParameter("email");
      logger.info(user_name+"/"+gender+"/"+age+"/"+email);
      
      if(user_name.equals("")) {
         logger.info("이름을 입력하세요");
         model.addAttribute("msg","이름을 입력하세요");
         model.addAttribute("info",params);//model은 동시에 날라감
         String page="마이페이지수정";
         model.addAttribute("page",page);
      }else if(gender.equals("")) {
         //logger.info("성별을 입력하세요");
         model.addAttribute("msg","성별을 입력하세요");
         model.addAttribute("info",params);
         String page="마이페이지수정";
         model.addAttribute("page",page);
      }else if(age.equals("")) {
         //logger.info("나이를 입력하세요");
         model.addAttribute("msg","나이를 입력하세요");
         model.addAttribute("info",params);
         String page="마이페이지수정";
         model.addAttribute("page",page);
      }else if(email.equals("")) {
         //logger.info("이메일을 입력하세요");
         model.addAttribute("msg","이메일을 입력하세요");
         model.addAttribute("info",params);
         String page="마이페이지수정";
         model.addAttribute("page",page);
      }else {
         logger.info("모두 완료");
         mypageservice.MypageUpdate(params,id);
         //model.addAttribute("msg","모두 완료");
         
         //String page="마이페이지상세보기";
         //model.addAttribute("id",id);
         model.addAttribute("page","마이페이지상세보기");
         MypageDTO mypageDTO = mypageservice.detail(id);
         model.addAttribute("detail",mypageDTO);
         //page="redirect:/MypageDetail?id="+params.get("id");
      }
   
      return "main";
   }

   @RequestMapping(value="/MypageQuit")
   public String MypageQuit(Model model,HttpSession session,@RequestParam String id) {
      
      logger.info(id);
      
      mypageservice.MypageQuit(id);
      
      session.removeAttribute("loginId");
      /*if(session.getAttribute("loginId")!=null) {
         service.withdraw(params);
         page="redirect:/list";
      }else {
         model.addAttribute("msg","로그인이 필요합니다");
      }*/
      //String page="null";
      
      
      return "main";
   }
   
   @RequestMapping(value="/MypageReviewListBridge")
   public String MypageReviewListBridge(@RequestParam String id,Model model,HttpServletRequest req) {
      //logger.info("MyreviewBridge");
      
      
      String page="나의 후기글 리스트";
      model.addAttribute("page",page);
      
      return "main";
   }

   @RequestMapping(value="/MypageReviewList")
   @ResponseBody
   public HashMap<String, Object> MypageReviewList(@RequestParam String id, @RequestParam int page) {
      //logger.info("테스트");
      logger.info(id);
      logger.info(page+"");
      //HashMap<String, Object> map = new HashMap<String, Object>();
      //ArrayList<HashMap<String, Object>> list = service.Myreview(id);
      //map.put("list", list);
      
      return mypageservice.MypageReviewList(id, page);
   }

   @RequestMapping(value="/MypageReviewDelete")
   @ResponseBody
   public HashMap<String, Object> MypageReviewDelete
      (@RequestParam(value="MypageReviewDeleteList[]") ArrayList<String> MypageReviewDeleteList){
      logger.info("list{}",MypageReviewDeleteList);
      
      int cnt =mypageservice.MypageReviewDelete(MypageReviewDeleteList);
      String msg=MypageReviewDeleteList.size()+"개 요청중";
      msg +=cnt+"개 삭제 완료";
      
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("msg", msg);
      
      return map;
   }
   
   @RequestMapping(value="/MypageRouteListBridge")
   public String MypageRouteListBridge(@RequestParam String id,Model model) {
      String page="나의 경로글 리스트";
      model.addAttribute("page",page);
      
      //logger.info("나의 경로글 잘넘오왔어여");
      //logger.info(id);
      return "main";
   }
   
   @RequestMapping(value="/MypageRouteList")
   @ResponseBody
   public HashMap<String, Object> MypageRouteList(@RequestParam String id, @RequestParam int page){
      //logger.info("마이루트 체크요");
      //HashMap<String, Object> map = new HashMap<String, Object>();
      //ArrayList<HashMap<String, Object>> list = mypageservice.MypageRouteList(id);
      //map.put("list", list);
      
      return mypageservice.MypageRouteList(id, page);
   }
   
   @RequestMapping(value="/MypageRouteDelete")
   @ResponseBody
   public HashMap<String, Object> MypageRouteDelete
      (@RequestParam(value="MypageRouteDeleteList[]") ArrayList<String> MypageRouteDeleteList){
      logger.info("list{}",MypageRouteDeleteList);
      
      int cnt =mypageservice.MypageRouteDelete(MypageRouteDeleteList);
      String msg=MypageRouteDeleteList.size()+"개 요청중";
      msg +=cnt+"개 삭제 완료";
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("msg", msg);
   
      return map;
   }
   
   @RequestMapping(value="/MypageCommentListBrigde")
   public String MypageReplyListBrigde(@RequestParam String id,Model model) {
      String page="나의 댓글 리스트";
      model.addAttribute("page",page);
      
      return "main";
   }
   
   @RequestMapping(value="/MypageCommentList")
   @ResponseBody
   public HashMap<String, Object> MypageCommentList(@RequestParam String id,@RequestParam int page){
      
      return mypageservice.MypageCommentList(id,page);
   }
   
   @RequestMapping(value="/MypageCommentDelete")
   @ResponseBody
   public HashMap<String, Object> MypageCommentDelete
      (@RequestParam(value="MypageCommentDeleteList[]") ArrayList<String> MypageCommentDeleteList){
      logger.info("list{}",MypageCommentDeleteList);
      
      int cnt =mypageservice.MypageCommentDelete(MypageCommentDeleteList);
      String msg=MypageCommentDeleteList.size()+"개 요청중";
      msg +=cnt+"개 삭제 완료";
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("msg", msg);
   
      return map;
   }
   

}