package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.gudi.dto.MypageDTO;
import kr.co.gudi.dto.ReviewDTO;
import kr.co.gudi.dto.RouteDTO;

public interface MypageDAO {

   MypageDTO detail(String id);

   //int MypageUpdate(HashMap<String, String> params);

   void MypageQuit(String id);

   ArrayList<ReviewDTO> MypageReviewList(String id, int offset);

   int totalCount(String id);

   int MypageReviewDeleteTripReviewTable(String board_idx);
   
   void MypageReviewDeleteBoardTable(String board_idx);

   ArrayList<RouteDTO> MypageRouteList(String id, int offset);
   
   int RouteListtotalCount(String id);

   int MypageRouteDeleteRouteTable(String board_idx);

   void MypageRouteDeleteBoardTable(String board_idx);

   void MypageUpdate(String id, String user_name, String gender, String age, String email);

   int MypageCommentListtotalCount(String id);

   ArrayList<HashMap<String, Object>> MypageCommentList(String id, int offset);

   int MypageCommentDeleteCommentTable(String comment_idx);
   
   //void MypageCommentDeleteBoardTable(String board_idx);

   


   


   

   


}