package kr.co.gudi.dao;

import java.util.ArrayList;

import kr.co.gudi.dto.ReviewDTO;

public interface UserPageDAO {

   int userPageReviewListTotalCount(String userId);

   ArrayList<ReviewDTO> userPageReviewList(String userId, int offset);

   ArrayList<ReviewDTO> userPageRouteList(String userId, int offset);

   ArrayList<ReviewDTO> userPageCommentList(String userId, int offset);

   int userPageRouteListTotalCount(String userId);

   int userPageCommentListTotalCount(String userId);
   
   

}