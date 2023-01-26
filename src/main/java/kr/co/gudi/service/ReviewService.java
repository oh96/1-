package kr.co.gudi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.gudi.dao.ReviewDAO;
import kr.co.gudi.dto.BoardDTO;
import kr.co.gudi.dto.LocateDTO;
import kr.co.gudi.dto.ReviewDTO;

@Service
public class ReviewService {

   Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @Autowired ReviewDAO reviewDAO;

   public HashMap<String, Object> list(int page) {
      logger.info("후기 리스트 호출"+page);
      HashMap<String, Object> result = new HashMap<String, Object>();
      
      int offset = (page-1)*10;
      int totalCount = reviewDAO.totalCount();
      logger.info("totalCount:"+totalCount);
      int totalPages = totalCount%10 >0 ? (totalCount/10)+1 : (totalCount/10); //총 페이지 수
      //Math.ceil(totalCount/10);
      logger.info(totalPages+"");
      //reviewDAO.list();
      result.put("total", totalPages);
      result.put("list", reviewDAO.list(offset));
      
      return result;
   }

   


   public BoardDTO reviewDetail(String board_idx) {
      logger.info("상세보기 요청");
      BoardDTO dto = reviewDAO.reviewDetail(board_idx);
      
      if (dto != null) {
         reviewDAO.hit(board_idx);
      }
      return dto;
   }

   public void reviewWrite(String id, String subject, String content, String loc_idx) {
      ReviewDTO reviewdto = new ReviewDTO();
      logger.info("후기쓰기");
      logger.info(id+"/"+subject+"/"+content);
      //String loc_idx = params.get("loc_idx");
      
      reviewdto.setId(id);
      reviewdto.setBoard_subject(subject);
      reviewdto.setBoard_content(content);
      reviewDAO.reviewWrite(reviewdto);
      int board_idx = reviewdto.getBoard_idx();
      
      review_info(loc_idx,board_idx);
      
   }
   private void review_info(String loc_idx, int board_idx) {
      reviewDAO.review_info(board_idx,loc_idx);
      
   }
   
   public BoardDTO reviewUpdateForm(String board_idx) {
      logger.info("수정 상세 보기 요청");
       
      
      return reviewDAO.reviewDetail(board_idx);
   }

   public String getLoc(String board_idx) {
      String loc_idx1 = reviewDAO.getLoc(board_idx);
      return loc_idx1;
   }
   
   public String getLocName(String loc_idx1) {
      String locName = reviewDAO.getLocName(loc_idx1);
      return locName;
   }
   public  void reviewUpdate(HashMap<String, String> params) {
      int row = reviewDAO.reviewUpdate(params);
      
      logger.info("수정된 행의 갯수:"+row);
      
      //review_update(loc_idx);
   }

   /*
    * private void review_update(String loc_idx) {
    * reviewDAO.review_update(loc_idx);
    * 
    * }
    */

   public void reviewDelete(String board_idx) {
      int row = reviewDAO.reviewDelete(board_idx);
      
   }

   public void reviewWrite(String id, HashMap<String, Object> params) {
      // TODO Auto-generated method stub
      
   }

   public Map<String, Object> reviewListPop(int page) {
      logger.info("list 호출");
         Map<String, Object> pageParam = new HashMap<String, Object>();

         int offset = (page-1)*10;
         pageParam.put("offset", offset);
         
         int totalCount = reviewDAO.totalCount();
         //logger.info("totalcount: "+totalCount);
         
         int totalPages = totalCount%10 > 0 ? (totalCount/10)+1 : (totalCount/10);
         //logger.info("총 페이지 수: "+totalPages);
         //logger.info("총 페이지 수 2: "+Math.ceil(totalCount/10));
         
         Map<String, Object> result = new HashMap<String, Object>();
         result.put("total",totalPages);
         result.put("list", reviewDAO.reviewListPop(pageParam));

         return result;

   }

   public List<LocateDTO> reviewsearchPlace(String keyword) {
      // TODO Auto-generated method stub
      return reviewDAO.reviewsearchPlace(keyword);
   }




   public void reviewLocUpdate(String board_idx, String loc_idx) {
      int row = reviewDAO.reviewLocUpdate(board_idx,loc_idx);
      
      logger.info("수정한"+row);
   }




   public void reviewUpdate(String board_idx, String board_subject, String board_content) {
      int row = reviewDAO.reviewUpdate(board_idx,board_subject,board_content);
      
   }




   public void reviewLocDelete(String board_idx) {
      int row = reviewDAO.reviewLocDelete(board_idx);
      
   }


   

   
   
   
   
   
}