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


import kr.co.gudi.dto.BoardDTO;
import kr.co.gudi.dto.NoticeDTO;
import kr.co.gudi.dto.ReviewDTO;
import kr.co.gudi.dto.UserDTO;
import kr.co.gudi.service.NoticeService;
import kr.co.gudi.service.UserGradeService;

@Controller
public class NoticeController {
   
   Logger logger = LoggerFactory.getLogger(this.getClass());
   
   
   @Autowired NoticeService noticeservice;
   @Autowired UserGradeService userGradeService;
   
   /*
    * @RequestMapping(value = "/notice") public String main() { return "notice"; }
    */
    
    
    @RequestMapping(value="/noticelistCall")
   @ResponseBody
   public HashMap<String, Object> noticelistCall(@RequestParam int page){
       logger.info("공지 리스트 호출"+page);
       return noticeservice.noticeList(page);
    }
    
    //관리자페이지에서 유저리스트호출
    
    @RequestMapping(value="/userlist")
    public String userlist(Model model) {
       String page = "유저리스트";
       model.addAttribute("page", page);
       return "main";
    }
    
    @RequestMapping(value="/userlistCall")
    @ResponseBody
    public HashMap<String, Object> userlistCall(@RequestParam int userpage){
       logger.info("유저 리스트 호출"+userpage);
       
       return noticeservice.userlist(userpage);
    }
    
    //관리자페이지에서 전체게시물호출
    
    @RequestMapping(value="/allList")
    public String alllist(Model model) {
       String page = "전체게시물";
       model.addAttribute("page", page);
       return "main";
    }
    
    
    @RequestMapping(value="/allListCall")
    @ResponseBody
    public HashMap<String, Object> allListCall(@RequestParam int page){
       logger.info("유저 리스트 호출"+page);
       
       return noticeservice.allListCall(page);
    }
    
    
    
    @RequestMapping(value = "/noticedetail")
      public String noticedetail(Model model,@RequestParam(value="board_idx", required=false) String board_idx) {
        
         logger.info("공지상세보기");
         BoardDTO boarddto = noticeservice.noticedetail(board_idx, model);
         model.addAttribute("boarddto",boarddto);
         model.addAttribute("page","공지정보상세보기");
         
         return "main";
     }
     
     //공지수정하기
    
       @RequestMapping(value="/noticeUpdateForm")
       public String noticeUpdateForm(Model model, @RequestParam String board_idx) {
       logger.info("공지수정요청");
       String page ="공지수정하기";
       BoardDTO boarddto = noticeservice.noticedetail(board_idx, model);
       model.addAttribute("boarddto",boarddto);
       model.addAttribute("page",page);
       return "main";
       }
    
    @RequestMapping(value="/noticeUpdate")
    public String noticeUpdate(Model model, @RequestParam HashMap<String, String>params,
          HttpServletRequest req,@RequestParam(value="id", required=false) String id) {
       logger.info("update params:"+params);
       HttpSession session = req.getSession();
       id =(String) session.getAttribute("loginId");
       logger.info("id: "+id);
       
       noticeservice.noticeupdate(params, id);
       String board_idx = params.get("board_idx");
       BoardDTO boarddto = noticeservice.noticedetail(board_idx, model);
       
       model.addAttribute("page","공지수정하기");
       model.addAttribute("boarddto",boarddto);
       logger.info(boarddto.getBoard_subject());
       
       return "main";
    }
    
    
     @RequestMapping(value="/noticeWriteForm")
      public String noticeWriteForm() {
         
         return "noticeWriteForm";
      }
     
     
     @RequestMapping(value="/noticeWrite")
      public String noticeWrite(Model model, HttpServletRequest req, @RequestParam(value="id", required=false) String id,@RequestParam HashMap<String, String> params) {
         logger.info("공지 쓰기 요청");
         HttpSession session = req.getSession();
         id = (String) session.getAttribute("loginId");
         logger.info(id);
         
         noticeservice.noticeWrite(id, params);
         
         model.addAttribute("page","공지");
         return "main";
     }
     

     //관리자 페이지 -- 여행지정보삭제
     @RequestMapping(value = "/AdminInfoList")
      public String AdminInfoList(Model model) {
         String page = "관리자여행지정보";
         model.addAttribute("page", page);
         return "main";
      }
      
      
      @RequestMapping(value="/AdminInfoListCall")
      @ResponseBody
      public HashMap<String, Object> AdminInfoListCall(@RequestParam int page){
         logger.info("정보 리스트 호출"+page);
         return noticeservice.admininfolist(page);
      }

      @RequestMapping(value = "/AdminInfoPhotoDelete")
      @ResponseBody
      public HashMap<String, Object> AdminInfoPhotoDelete(
            @RequestParam(value = "AdminInfoPhotoDeleteList[]") ArrayList<String> AdminInfoPhotoDeleteList) {
         logger.info("list{}", AdminInfoPhotoDeleteList);

         int cnt = noticeservice.AdminInfoPhotoDelete(AdminInfoPhotoDeleteList);
         String msg = AdminInfoPhotoDeleteList.size() + "개 요청중";
         msg += cnt + "개 삭제 완료";

         HashMap<String, Object> map = new HashMap<String, Object>();
         map.put("msg", msg);

         return map;
      }
      
      //관리자페이지 -- 블라인드
       @RequestMapping(value="/blindList")
          public String blindList(Model model) {
             String page = "블라인드";
             model.addAttribute("page", page);
             return "main";
          }
      
      
      @RequestMapping(value = "/blindListCall")
      @ResponseBody
      public HashMap<String, Object> blindList() {
         
      return noticeservice.getInfo();
      }
      
      @RequestMapping(value = "/AdminBlindDelete")
      @ResponseBody
      public HashMap<String, Object> AdminBlindDelete(
            @RequestParam(value = "AdminBlindDeleteList[]") ArrayList<String> AdminBlindDeleteList) {
         logger.info("list{}", AdminBlindDeleteList);

         int cnt = noticeservice.AdminBlindDelete(AdminBlindDeleteList);
         String msg = AdminBlindDeleteList.size() + "개 요청중";
         msg += cnt + "개 삭제 완료";

         HashMap<String, Object> map = new HashMap<String, Object>();
         map.put("msg", msg);

         return map;
      }
      
   
      
}