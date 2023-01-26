package kr.co.gudi.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.dao.MypageDAO;
import kr.co.gudi.dto.MypageDTO;

@Service
public class MyPageService {

   @Autowired MypageDAO mypagedao;
   
   Logger logger = LoggerFactory.getLogger(getClass());

   public MypageDTO detail(String id) {
      //logger.info("service까지 넘어옴 확인");
      
      return mypagedao.detail(id);
   }
   
   /*
   public void MypageUpdate(HashMap<String, String> params) {
      mypagedao.MypageUpdate(params);
      String user_name = params.get("user_name");
      String gender = params.get("gender");
      String age = params.get("age");
      String email = params.get("email");
      //logger.info("수정된 행의 갯수:"+row);
      logger.info(user_name+"/"+gender+"/"+age+"/"+email);
      
   }
   */
     public void MypageUpdate(HashMap<String, String> params,String id) {
      String user_name = params.get("user_name");
      String gender = params.get("gender");
      String age = params.get("age");
      String email = params.get("email");
      // logger.info("수정된 행의 갯수:"+row);
      logger.info(id+"/"+user_name+"/"+gender+"/"+age+"/"+email);
      mypagedao.MypageUpdate(id,user_name,gender,age,email);
      
   }   
    
   
   public void MypageQuit(String id) {
      
      mypagedao.MypageQuit(id);
      
   }

   public HashMap<String, Object> MypageReviewList(String id, int page) {
      //logger.info("list 호출");
      int offset=(page-1)*10;
      
      HashMap<String, Object> result = new HashMap<String, Object>();
      //ArrayList<ReviewDTO> list = dao.Myreview(id);
      //logger.info(list+"");
      int totalCount=mypagedao.totalCount(id);
      logger.info("total count: "+totalCount);
      
      int totalPages = totalCount%10 >0 ?(totalCount/10)+1:(totalCount/10);//총페이지수
      logger.info("총페이지 수: "+totalPages);
      
      result.put("total", totalPages);
      result.put("list", mypagedao.MypageReviewList(id, offset));
      
      return result;
      
   }

   public int MypageReviewDelete(ArrayList<String> MypageReviewDeleteTripReviewTable) {
      
      int total=0;
      
      for(String board_idx : MypageReviewDeleteTripReviewTable) {
         logger.info("체크요"+board_idx);
         total +=mypagedao.MypageReviewDeleteTripReviewTable(board_idx);
         MypageReviewDeleteBoardTable(board_idx);
      }
      logger.info("총 지운 갯수"+total);
      
      return total;
   }
   
   private void MypageReviewDeleteBoardTable(String board_idx) {
       mypagedao.MypageReviewDeleteBoardTable(board_idx);
   }


   public HashMap<String, Object> MypageRouteList(String id, int page) {
      
      int offset=(page-1)*10;
      
      HashMap<String, Object> result = new HashMap<String, Object>();
      //ArrayList<ReviewDTO> list = dao.Myreview(id);
      //logger.info(list+"");
      int RouteListtotalCount=mypagedao.RouteListtotalCount(id);
      logger.info("total count: "+RouteListtotalCount);
      
      int RouteListtotalPages = RouteListtotalCount%10 >0 ?(RouteListtotalCount/10)+1:(RouteListtotalCount/10);//총페이지수
      logger.info("총페이지 수: "+RouteListtotalPages);
      
      result.put("total", RouteListtotalPages);
      result.put("list", mypagedao.MypageRouteList(id, offset));
      
      return result;
   }



   public int MypageRouteDelete(ArrayList<String> MypageRouteDeleteRouteTable) {
      
      int total=0;
      
      for(String board_idx : MypageRouteDeleteRouteTable) {
         //logger.info("체크요"+board_idx);
         total +=mypagedao.MypageRouteDeleteRouteTable(board_idx);
         MypageRouteDeleteBoardTable(board_idx);
         //route테이블에서 한번 board테이블에서 한번 지워준다
      }
      logger.info("총 지운 갯수"+total);

      return total;
   }

   private void MypageRouteDeleteBoardTable(String board_idx) {
      mypagedao.MypageRouteDeleteBoardTable(board_idx);      
   }
   
   public HashMap<String, Object> MypageCommentList(String id, int page) {
      
      int offset=(page-1)*10;
      
      
      HashMap<String, Object> result = new HashMap<String, Object>();

      int MypageCommentListtotalCount=mypagedao.MypageCommentListtotalCount(id);
      logger.info("total count: "+MypageCommentListtotalCount);
      
      int MypageCommentListtotalPages = MypageCommentListtotalCount%10 >0 ?(MypageCommentListtotalCount/10)+1:(MypageCommentListtotalCount/10);//총페이지수
      logger.info("총페이지 수: "+MypageCommentListtotalPages);
      
      result.put("total", MypageCommentListtotalPages);
      result.put("list", mypagedao.MypageCommentList(id, offset));
      
      
      return result;
   }

   public int MypageCommentDelete(ArrayList<String> MypageCommentDeleteCommentTable) {
      
      int total=0;
      
      for(String comment_idx : MypageCommentDeleteCommentTable) {
         //logger.info("체크요"+board_idx);
         total +=mypagedao.MypageCommentDeleteCommentTable(comment_idx);
         //MypageCommentDeleteBoardTable(board_idx);
         //route테이블에서 한번 board테이블에서 한번 지워준다
      }
      logger.info("총 지운 갯수"+total);

      return total;
   }

//   private void MypageCommentDeleteBoardTable(String board_idx) {
//      mypagedao.MypageCommentDeleteBoardTable(board_idx);
//      
//   }


   


   
   
}