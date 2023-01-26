package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.gudi.dto.BlindDTO;
import kr.co.gudi.dto.BoardDTO;
import kr.co.gudi.dto.InfoDTO;
import kr.co.gudi.dto.NoticeDTO;
import kr.co.gudi.dto.PhotoDTO;
import kr.co.gudi.dto.UserDTO;

public interface NoticeDAO {

   
   ArrayList<HashMap<String, Object>> noticeList(int offset);
   
   int totalCount();
   
   int userTotalCount();

   BoardDTO noticedetail(String board_idx);

   void hit(String board_idx);

   void noticeWrite(String id, String subject, String content);

   ArrayList<PhotoDTO> fileList(String idx);

   void fileWrite(int fileidx, String oriFileName, String newFileName);

   void noticeWrite(NoticeDTO dto);

   void notice(int board_idx, String fixed);

   int noticeupdate(HashMap<String, String> params);

   ArrayList<UserDTO> userlist(int offset);
   //ArrayList<HashMap<String, Object>> userlist(int offset);

   

      int adminReviewDeleteList(String board_idx);
        
      void adminReviewDeleteBoardTable(String board_idx);
       
      int adminReviewDeletetripInfo(String board_idx);

      int AdminInfototalCount(String id);
      
      
      int infototalCount(String id);

      ArrayList<InfoDTO> AdminInfoList(String id, int offset);

      List<Map<String, Object>> AdminInfototalCount(Map<String, Object> pageParam);

      int AdmintotalCount();

      

      int AdminInfototalCount();

      List<BoardDTO> AdminInfoList(int offset);

      int AdminInfoPhotoDelete(String board_idx);

      void AdminTripInfoDelete(String board_idx);

      void AdminInfoDelete(String board_idx);

   
      
      //ArrayList<BoardDTO> alllist(int offset);

      int allTotalCount();

      ArrayList<BoardDTO> allList(int offset);


      ArrayList<HashMap<String, Object>> blindInfo();

      void noticeupdate(String board_idx, String board_subject, String board_content, String id);

      int AdminBlindDelete(String blind_idx);
   
}