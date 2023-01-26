package kr.co.gudi.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.dao.HomeDAO;

@Service
public class HomeService {

   @Autowired HomeDAO homedao;

   Logger logger = LoggerFactory.getLogger(this.getClass());

   public HashMap<String, Object> locationTop(int page) {
      //logger.info("check1" + page);
      
      HashMap<String, Object> result = new HashMap<String,Object>();

      int offset = (page - 1) * 10;
      int totalCount = homedao.locationtotalCount();
      logger.info("totalCount" + totalCount);
      int totalPages = totalCount % 10 > 0 ? (totalCount / 10) + 1 : (totalCount / 10);
      logger.info(totalPages + "");

      result.put("total", totalPages);
      result.put("infolist", homedao.locationTop(offset));

      return result;
   }

   public HashMap<String, Object> reviewTop(int page) {
      
      HashMap<String, Object> result = new HashMap<String,Object>();

      int offset = (page - 1) * 10;
      int totalCount = homedao.reviewtotalCount();
      logger.info("totalCount" + totalCount);
      int totalPages = totalCount % 10 > 0 ? (totalCount / 10) + 1 : (totalCount / 10);
      logger.info(totalPages + "");

      result.put("total", totalPages);
      result.put("reviewlist", homedao.reviewTop(offset));

      return result;
   }

   public HashMap<String, Object> routeTop(int page) {

      HashMap<String, Object> result = new HashMap<String,Object>();

      int offset = (page - 1) * 10;
      int totalCount = homedao.routetotalCount();
      logger.info("totalCount" + totalCount);
      int totalPages = totalCount % 10 > 0 ? (totalCount / 10) + 1 : (totalCount / 10);
      logger.info(totalPages + "");

      result.put("total", totalPages);
      result.put("routelist", homedao.routeTop(offset));

      return result;
   }

}