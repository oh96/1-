package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.gudi.dto.BoardDTO;
import kr.co.gudi.dto.LocateDTO;
import kr.co.gudi.dto.ReviewDTO;

public interface ReviewDAO {

   ArrayList<HashMap<String, Object>> list(int offset);

   

   void review_info(int board_idx, String loc_idx);
   
   
   
   BoardDTO reviewDetail(String board_idx);

   void reviewWrite(ReviewDTO reviewdto);

   

   int reviewUpdate(HashMap<String, String> params);

   int reviewDelete(String board_idx);

   int totalCount();

   void hit(String board_idx);


   List<LocateDTO> reviewsearchPlace(String keyword);

   List<Map<String, Object>> reviewListPop(Map<String, Object> pageParam);

   void review_update(String loc_idx);

   LocateDTO reviewloc(String loc_idx);



   String getLoc(String board_idx);



   String getLocName(String loc_idx1);



   int reviewLocUpdate(String board_idx, String loc_idx);



   int reviewUpdate(String board_idx, String board_subject, String board_content);



   int reviewLocDelete(String board_idx);





}