package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kr.co.gudi.dto.RouteDTO;


public interface RouteDAO {

   String getDoro(Object sight1);

   void routeWrite(RouteDTO dto);

   void route(int board_idx, Object locationIdx, int routeSeq);
   
   void route1(int board_idx, Object locationIdx, int routeSeq);

   int totalCount();
   int totalCount1(int board_idx);

   ArrayList<HashMap<String, Object>> routelist(int offset);
   
   List<HashMap<String, Object>> routeDetail(String board_idx);
   
   void hit(String board_idx);

   List<HashMap<String, Object>> routeInfo(String board_idx);

   void routeUpdate(int board_idx, String title, String content);
 
   void routeDelete(int board_idx);

   void commentWrite(String board, String loginId, String comment, int rating);

   ArrayList<HashMap<String, Object>> commentlist(int board_idx, int offset);

   float starAvg(int board_idx);

   void routeEraseChild1(int board_idx);

   void routeEraseChild2(int board_idx);
   
   void routeEraseParent(int board_idx);

   String routeBlindInfo(int board_idx);

   void routeBlind(int board_idx, String id, String authorId, String reason);

   int getBoard(int comment_idx);

   void commentDelete(int comment_idx);

   int reWrite(String loginId, String board);


}