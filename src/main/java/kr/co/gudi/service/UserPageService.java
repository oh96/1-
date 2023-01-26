package kr.co.gudi.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.dao.UserPageDAO;

@Service
public class UserPageService {

   Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @Autowired UserPageDAO userPageDAO;

   public HashMap<String, Object> userPageReviewList(String userId, int page) {

      int offset=(page-1)*10;

      HashMap<String, Object> result = new HashMap<String, Object>();

      int totalCount=userPageDAO.userPageReviewListTotalCount(userId);
      logger.info("total count: "+totalCount);

      int totalPages = totalCount%10 >0 ?(totalCount/10)+1:(totalCount/10);
      logger.info("총페이지 수: "+totalPages);

      result.put("total", totalPages);
      result.put("list", userPageDAO.userPageReviewList(userId, offset));

      return result;
   }

   
   public HashMap<String, Object> userPageRouteList(String userId, int page) {
      
      int offset=(page-1)*10;

      HashMap<String, Object> result = new HashMap<String, Object>();

      int totalCount=userPageDAO.userPageRouteListTotalCount(userId);
      logger.info("total count: "+totalCount);

      int totalPages = totalCount%10 >0 ?(totalCount/10)+1:(totalCount/10);
      logger.info("총페이지 수: "+totalPages);

      result.put("total", totalPages);
      result.put("list", userPageDAO.userPageRouteList(userId, offset));

      return result;
   }


   public HashMap<String, Object> userPageCommentList(String userId, int page) {
      int offset=(page-1)*10;

      HashMap<String, Object> result = new HashMap<String, Object>();

      int totalCount=userPageDAO.userPageCommentListTotalCount(userId);
      logger.info("total count: "+totalCount);

      int totalPages = totalCount%10 >0 ?(totalCount/10)+1:(totalCount/10);
      logger.info("총페이지 수: "+totalPages);

      result.put("total", totalPages);
      result.put("list", userPageDAO.userPageCommentList(userId, offset));

      return result;
   }
}