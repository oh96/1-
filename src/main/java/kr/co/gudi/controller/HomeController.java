package kr.co.gudi.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gudi.service.HomeService;

@Controller
public class HomeController {
   
   Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @Autowired HomeService homeservice;
   
   @RequestMapping(value="/locationTop")
   @ResponseBody
   public HashMap<String,Object> locationTop(@RequestParam int page) {
      //logger.info("메인화면 리스트:"+page);
      
      return homeservice.locationTop(page);
   }
   
   @RequestMapping(value="/reviewTop")
   @ResponseBody
   public HashMap<String, Object> reviewTop(@RequestParam int page){
      //logger.info("리뷰 :"+page);
      
      return homeservice.reviewTop(page);
   }
   
   @RequestMapping(value="/routeTop")
   @ResponseBody
   public HashMap<String, Object> routeTop(@RequestParam int page){
      //logger.info("리뷰 :"+page);
      
      return homeservice.routeTop(page);
   }
   
}