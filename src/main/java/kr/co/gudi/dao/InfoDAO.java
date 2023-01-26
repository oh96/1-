package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.co.gudi.dto.BoardDTO;
import kr.co.gudi.dto.InfoDTO;
import kr.co.gudi.dto.LocateDTO;
import kr.co.gudi.dto.PhotoDTO;

public interface InfoDAO {

   int infoWrite(InfoDTO dto);
   
   void trip_info(String board_idx, String loc_idx);
   
   void fileWrite(int idx, String oriFileName, String newFileName);

   List<Map<String, Object>> infoListPop(Map<String, Object> pageParam);

   int totalCount();

   List<LocateDTO> searchPlace(String keyword);

   List<Map<String, Object>> infoList(Map<String, Object> pageParam);

   BoardDTO infoDetail(String board_idx);

   LocateDTO call_xy(String board_idx);

   void infoUpdate(String board_idx, String board_subject, String board_content, String id);

   void trip_infoUpdate(String board_idx, String loc_idx);

   int infototalCount();

   void addPhoto(String board_idx, String oriFileName, String newFileName);

   ArrayList<PhotoDTO> getPhoto(String board_idx);

   void infoPhotoUpdate(String board_idx, String oriFileName, String newFileName);
   
   void deletePhoto(String board_id, String oriFileName);
   
   void deleteAllPhotos(String board_id);

   void infoUpHit(String board_idx);

   int detailTotalCount(String keyword);
   
   List<LocateDTO> detailPopUpSearch(String keyword, int offset);

}