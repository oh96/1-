package kr.co.gudi.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.gudi.dto.BoardDTO;
import kr.co.gudi.dto.LocateDTO;
import kr.co.gudi.dto.PhotoDTO;
import kr.co.gudi.service.InfoService;

@Controller
public class InfoController {

   Logger logger = LoggerFactory.getLogger(this.getClass());

   @Autowired InfoService infoservice;

   
   /*
    * 글쓰기 
    */
   @RequestMapping(value = "/infoWriteForm")
   public String infoWriteForm(Model model) {
      
      return "infoWriteForm";
   }

   @RequestMapping(value = "/infoWrite")
   public String infoWrite(Model model, MultipartHttpServletRequest mreq, 
         HttpServletRequest req,@RequestParam(value="id", required=false) String id,@RequestParam HashMap<String, String> params) {
      
      List<MultipartFile> fileList = mreq.getFiles("photo");
   
      logger.info("params: " + params);
      HttpSession session = req.getSession();
      id = (String) session.getAttribute("loginId");
      logger.info(id);

      
      String page = "여행지정보상세보기";
      String board_subject = params.get("board_subject");
      String location_input = params.get("location_input");
      String board_content = params.get("board_content");
      String loc_idx = params.get("loc_idx");
      
      String msg = "";
      
      if (board_subject.equals("")||board_subject==null) {
         msg = "여행지를 선택하세요.";
         page = "여행지정보글쓰기";
         model.addAttribute("msg",msg);
      }else if (board_content.equals("")||board_content==null) {
         msg = "내용을 입력하세요.";
         page = "여행지정보글쓰기";
      }else {
         HashMap<String, Object> result = infoservice.infoWrite(id, fileList , params);
         BoardDTO boarddto = (BoardDTO) result.get("boarddto");
         LocateDTO locatedto = (LocateDTO) result.get("locatedto");
         ArrayList<PhotoDTO> photolist = (ArrayList<PhotoDTO>) result.get("photolist");
         
         page = "여행지정보상세보기";
         model.addAttribute("boarddto", boarddto);
         model.addAttribute("locatedto", locatedto);
         model.addAttribute("photolist", photolist);
         
         logger.info(locatedto+"");
         logger.info(board_subject);
         logger.info(board_content);
      }
      
      /*
      if(session.getAttribute("loginId") != null) {
         ArrayList<> list = service.list();
         map.put("list", list);
         map.put("login", true);
      }else {
         map.put("login", false);
         // model.addAttribute("msg","로그인이 필요한 서비스입니다."); -> 이렇게 직접 문구를 주는 코드는 잘 사용하지 않는다.(바꿀 때 마다 서버를 건드려야 하기 때문)
      }
      */
      model.addAttribute("page", page);
      model.addAttribute("msg", msg);
      model.addAttribute("board_subject", board_subject);
      model.addAttribute("board_content", board_content);
      model.addAttribute("location_input", location_input);
      model.addAttribute("loc_idx", loc_idx);
      
      return "main";
   }

   
   /*
    * 글 수정 
    */
   
   @RequestMapping(value="/infoUpdateForm")
   public String infoUpdateForm(Model model, @RequestParam String board_idx, @RequestParam String loc_idx) {
      logger.info("수정 요청");
      String page = "여행지정보수정하기";
      BoardDTO boarddto = infoservice.infoDetail(board_idx,model);
      model.addAttribute("boarddto",boarddto);
      logger.info(loc_idx);
      model.addAttribute("loc_idx",loc_idx);
      model.addAttribute("page",page);
      return "main";
   }

   
   
   @RequestMapping(value="/infoUpdate")
   public String infoUpdate(Model model, MultipartHttpServletRequest mreq,@RequestParam HashMap<String, String> params, 
         HttpServletRequest req, @RequestParam(value="id", required=false) String id) {
      
      List<MultipartFile> fileList = mreq.getFiles("photo");
      logger.info("update params: "+params);
      HttpSession session = req.getSession();
      id = (String) session.getAttribute("loginId");
      logger.info("id: "+id);
      infoservice.infoUpdate(fileList,params,id);
      String board_idx = params.get("board_idx");
      BoardDTO boarddto = infoservice.infoDetail(board_idx,model);
      LocateDTO locatedto = infoservice.call_xy(board_idx);
      ArrayList<PhotoDTO> photolist = infoservice.getPhoto(board_idx);
      
      // infoDetail.jsp 에서 호출하는 모든 param 설정
      model.addAttribute("page","여행지정보상세보기");
      model.addAttribute("boarddto",boarddto);
      model.addAttribute("locatedto",locatedto);
      model.addAttribute("photolist", photolist);
      logger.info(boarddto.getBoard_subject());
      //model.addAttribute("board_idx",params.get("board_idx"));
      
      return "main";
   }
   
   
   
   /*
    * 여행지 리스트 
    */
   @RequestMapping(value="/infoListCall")
   public String infoListCall() {
      return "infoList";
   }
   
   @RequestMapping(value="/infoList")
   @ResponseBody
   public Map<String, Object> infoList(Model model,@RequestParam int page) {
      logger.info("여행지 정보 리스트 컨트롤러");
      // HashMap<String, Object> map = new HashMap<String, Object>();
      /*
      ArrayList<BoardDTO> list = infoservice.infoList(int page);
      map.put("list", list);
      logger.info("list: "+list);
      */
      logger.info("page: "+page);
      
      return infoservice.infoList(page);
   }
   
   
   /*
    * 여행지 상세보기 
    */

   @RequestMapping(value="/infoDetail")
   public String infoDetail(Model model, @RequestParam String board_idx) {
      logger.info("상세보기 컨트롤러");
      BoardDTO boarddto = infoservice.infoDetail(board_idx, model);
      LocateDTO locatedto = infoservice.call_xy(board_idx);
      ArrayList<PhotoDTO> photolist = infoservice.getPhoto(board_idx);
      
      model.addAttribute("page","여행지정보상세보기");
      model.addAttribute("boarddto", boarddto);
      model.addAttribute("locatedto", locatedto);
      model.addAttribute("photolist",photolist);
      //model.addAttribute("infoPhotoList",infoPhotoList);
      
      return "main";
   }
   

   
   /*
    * 팝업 리스트
    */
   @RequestMapping(value="/infoListPopup")
   public String infoListPopup() {
      return "infoListPopup";
   }
   
   @RequestMapping(value = "/infoListPop")
   @ResponseBody
   public Map<String, Object> infoListPop(@RequestParam int page){
      logger.info("리스트 요청: "+page);

      return infoservice.infoListPop(page);
   }

   
   /*
    * 여행지 검색 
    */
   @RequestMapping(value="/searchPlace", method=RequestMethod.GET)
   @ResponseBody
   public HashMap<String, Object> searchPlace(HttpServletRequest req) {
      
      // List<LocateDTO> locateList = new ArrayList<LocateDTO>();
      String keyword = req.getParameter("keyword");
      String page = req.getParameter("page");
      logger.info(keyword+page);
      
      //HashMap<String, Object> map = new HashMap<String, Object>();
      //map.put("list", infoservice.searchPlace(keyword));
      
      return infoservice.searchPlace(keyword, page);
   }
   
}

