package kr.co.gudi.service;


import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.dao.RouteDAO;
import kr.co.gudi.dto.RouteDTO;

@Service
public class RouteService {


   Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @Autowired RouteDAO routeDAO;
   
   

   public String getDoro(Object sight1) {
      
      return routeDAO.getDoro(sight1);
   }
   
   public void routeUpdate(Object[] locationIdx, String title, String content, int board_idx) {
      
      routeDelete(board_idx);

      
      routeDAO.routeUpdate(board_idx, title, content);
      
      for(int i=0; i<locationIdx.length; i++) {
            int[] routeSeq = new int[locationIdx.length];
            routeSeq[i] = (i+1);
            
            route1(board_idx, locationIdx[i], routeSeq[i]);
      }
   }

   private void routeDelete(int board_idx) {
   routeDAO.routeDelete(board_idx);
}

private void route1(int board_idx, Object locationIdx, int routeSeq) {
      routeDAO.route1(board_idx, locationIdx, routeSeq);
}

public int routeWrite(Object[] locationIdx, String loginId, String title, String content) {
      
      RouteDTO routeDTO = new RouteDTO();
      
      routeDTO.setId(loginId);
      routeDTO.setBoard_subject(title);
      routeDTO.setBoard_content(content);
      
      routeDAO.routeWrite(routeDTO);
      
      int board_idx = routeDTO.getBoard_idx();
      
      for(int i=0; i<locationIdx.length; i++) {
         int[] routeSeq = new int[locationIdx.length];
         routeSeq[i] = (i+1);
         
         route(board_idx, locationIdx[i], routeSeq[i]);
      }
      return board_idx;
   }
   

   private void route(int board_idx, Object locationIdx, int routeSeq) {
      routeDAO.route(board_idx, locationIdx, routeSeq);
      
   }
   
   public  HashMap<String, Object> routelist(int page) {
         logger.info("후기 리스트 호출"+page);
         HashMap<String, Object> result = new HashMap<String, Object>();
         
         int offset = (page-1)*10;
         logger.info(offset+"====================");
         int totalCount = routeDAO.totalCount();
         logger.info(totalCount+"------111111111111");

         int totalPages = totalCount%10 >0 ? (totalCount/10)+1 : (totalCount/10); //총 페이지 수

         result.put("total", totalPages);
         result.put("routelist", routeDAO.routelist(offset));
         
         return result;
      }
   
   public HashMap<String, Object> commentList(int board_idx, int page) {
      HashMap<String, Object> result = new HashMap<String, Object>();
      int offset = (page-1)*5;
      int totalCount = routeDAO.totalCount1(board_idx);
      logger.info(totalCount+"--------222222222222");
      int totalPages = totalCount%5 > 0 ? (totalCount/5)+1 : (totalCount/5);
      
      float starAvg = routeDAO.starAvg(board_idx);
      logger.info("별점 평균"+starAvg);
      result.put("starAvg", starAvg);
      result.put("total", totalPages);
      result.put("commentlist", routeDAO.commentlist(board_idx, offset));
      
      logger.info(result+"");
      
      return result;
   }
   
   
   public List<HashMap<String, Object>> routeDetail(String board_idx) {

      List<HashMap<String, Object>> map = routeDAO.routeDetail(board_idx);
      
      if (map != null) {
         routeDAO.hit(board_idx);
      }
      return map;
   }

public List<HashMap<String, Object>> routeInfo(String board_idx) {
   List<HashMap<String, Object>> routeInfo1 = routeDAO.routeInfo(board_idx);
   return routeInfo1;
}

public void commentWrite(String board, String loginId, String comment, int rating) {
   routeDAO.commentWrite(board, loginId, comment, rating);
   
}

public void routeErase(int board_idx) {
   routeDAO.routeEraseChild1(board_idx);
   routeDAO.routeEraseChild2(board_idx);
   
   
   routeDAO.routeEraseParent(board_idx);
}

public String routeBlindInfo(int board_idx) {
   String authorId= routeDAO.routeBlindInfo(board_idx);
   return authorId;
}

public void routeBlind(int board_idx, String id, String authorId, String reason) {
   routeDAO.routeBlind(board_idx, id, authorId, reason);
}

public int getBoard(int comment_idx) {
   int board_idx = routeDAO.getBoard(comment_idx);
   return board_idx;
}

public void commentDelete(int comment_idx) {
   routeDAO.commentDelete(comment_idx);
   
}

public int reWrite(String loginId, String board) {
   logger.info("댓글 재작성 확인");
   
   return routeDAO.reWrite(loginId, board);
}





}