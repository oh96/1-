package kr.co.gudi.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gudi.dao.InfoDAO;
import kr.co.gudi.dto.BoardDTO;
import kr.co.gudi.dto.InfoDTO;
import kr.co.gudi.dto.LocateDTO;
import kr.co.gudi.dto.PhotoDTO;

@Service
public class InfoService {
   
   Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @Autowired InfoDAO infodao;

   /*
    * 글쓰기 
    */
   public HashMap<String, Object> infoWrite(String id, List<MultipartFile> fileList, HashMap<String, String> params) {

      logger.info("infoWrite 호출"); // 파일 업로드가 없어도 null 이 아니다.
      InfoDTO infodto = new InfoDTO();
      
      infodto.setId(id);
      infodto.setBoard_subject(params.get("board_subject"));
      infodto.setBoard_content(params.get("board_content"));
      
      String loc_idx=params.get("loc_idx");
      
      int success = infodao.infoWrite(infodto);
      String board_idx = infodto.getBoard_idx();
      
      trip_info(board_idx,loc_idx);
      
      BoardDTO boarddto = infodao.infoDetail(board_idx);
      LocateDTO locatedto = infodao.call_xy(board_idx);
      logger.info(board_idx);
      logger.info(locatedto+"");
      
      HashMap<String, Object> result = new HashMap<String, Object>();
      result.put("boarddto", boarddto);
      result.put("locatedto", locatedto);
      
      logger.info("write success: {}",board_idx);
      result.put("photolist", fileUpload(fileList,board_idx));
      
      return result;

   }

   private void trip_info(String board_idx,String loc_idx) {
      infodao.trip_info(board_idx,loc_idx);
   }

   private ArrayList<PhotoDTO> fileUpload(List<MultipartFile> fileList, String board_idx) { // 사진 업로드
      
      try { 
         for(int i = 0; i<fileList.size(); i++) {
            MultipartFile file = fileList.get(i);
            String oriFileName = file.getOriginalFilename();
            String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
            String newFileName = System.currentTimeMillis()+i+ext;

            //logger.info(oriFileName);
            //logger.info(newFileName);
            infodao.addPhoto(board_idx,oriFileName,newFileName);
            byte[] bytes = fileList.get(i).getBytes();
            Path path = Paths.get("C:/upload/"+newFileName);
            Files.write(path, bytes);
         }      
      }catch (Exception e) {
          e.printStackTrace();
      } 
      
      ArrayList<PhotoDTO> photolist = infodao.getPhoto(board_idx);

      return photolist;
   }
   
   public ArrayList<PhotoDTO> getPhoto(String board_idx) { // photo 테이블에 해당 게시물 번호 insert
      return infodao.getPhoto(board_idx);
   }

   
   /*
    * 글 수정 
    */
   public void infoUpdate(List<MultipartFile> fileList, HashMap<String, String> params, String id) { // 글 수정
      logger.info("수정 서비스");
      String board_idx = params.get("board_idx");
      String board_subject = params.get("board_subject");
      String board_content = params.get("board_content");
      String loc_idx = params.get("loc_idx");
      logger.info(board_idx+'/'+board_subject+'/'+board_content);
      logger.info("service id: "+id);
      infodao.infoUpdate(board_idx,board_subject,board_content,id);
      
      trip_infoUpdate(board_idx,loc_idx); // 여행지 테이블에 해당 게시물 번호에 수정된 여행지 번호로 update
      infoPhotoUpdate(board_idx,fileList); // photo 테이블에 해당 게시물 번호에 대해 수정된 사진으로 update

   }

   
   
   
   private void infoPhotoUpdate(String board_idx,List<MultipartFile> fileList) { //여기..
      try { 
         // 해당 게시물에 저장되어있던 이미지 전체 삭제
         infodao.deleteAllPhotos(board_idx);
         
         // 업로드한 파일이 있을 경우에만 파일 업로드 진행
         if(fileList.size() > 0) {
            for(int i = 0; i<fileList.size(); i++) {
               
               MultipartFile target = fileList.get(i);
               
               String oriFileName = target.getOriginalFilename();
               String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
               String newFileName = System.currentTimeMillis()+i+ext;
               
//               infodao.deletePhoto(board_idx, oriFileName);
               // 신규로 등록된 파일 저장
               infodao.addPhoto(board_idx,oriFileName,newFileName);
               byte[] bytes = fileList.get(i).getBytes();
               Path path = Paths.get("C:/upload/"+newFileName);
               Files.write(path, bytes);
               
//               infodao.infoPhotoUpdate(board_idx, oriFileName, newFileName);
            }
//         } else {
            
         }
      }catch (Exception e) {
          e.printStackTrace();
      }
//      ArrayList<PhotoDTO> photolist = infodao.getPhoto(board_idx);
      
   }

   
   
   
   private void trip_infoUpdate(String board_idx, String loc_idx) {
      infodao.trip_infoUpdate(board_idx,loc_idx);
   }

   
   /*
    * 팝업 리스트
    */
   public Map<String, Object> infoListPop(int page) {
      logger.info("list 호출");
      Map<String, Object> pageParam = new HashMap<String, Object>();

      int offset = (page-1)*10;
      pageParam.put("offset", offset);
      
      int totalCount = infodao.totalCount();
      logger.info("totalcount: "+totalCount);
      
      int totalPages = totalCount%10 > 0 ? (totalCount/10)+1 : (totalCount/10);
      logger.info("총 페이지 수: "+totalPages);
      logger.info("총 페이지 수 2: "+Math.ceil(totalCount/10));
      
      Map<String, Object> result = new HashMap<String, Object>();
      result.put("total",totalPages);
      result.put("list", infodao.infoListPop(pageParam));

      return result;

   }

   
   /*
    * 여행지 검색 
    */
   public HashMap<String, Object> searchPlace(String keyword, String page) {
      
	  HashMap<String, Object> result = new HashMap<String, Object>();
	  int offset = (Integer.parseInt(page)-1)*10;
	  int totalCount = infodao.detailTotalCount(keyword);
	  logger.info("totalCount:"+totalCount);
	  int totalPages = totalCount%10 >0 ? (totalCount/10)+1 : (totalCount/10); //총 페이지 수
	  logger.info(totalPages+"");
	  result.put("total", totalPages);
	  List<LocateDTO> list = infodao.detailPopUpSearch(keyword, offset);
	  result.put("list", list);
      
      return result;
   }

   
   /*
    * 여행지 정보 리스트 
    */
   public Map<String, Object> infoList(int page) {
      logger.info("여행지 정보 리스트 서비스");
      Map<String, Object> pageParam = new HashMap<String, Object>();

      int offset = (page-1)*10;
      pageParam.put("offset", offset);
      
      int infototalCount = infodao.infototalCount();
      logger.info("totalcount: "+infototalCount);
      
      int totalPages = infototalCount%10 > 0 ? (infototalCount/10)+1 : (infototalCount/10);
      logger.info("총 페이지 수: "+totalPages);
      logger.info("총 페이지 수 2: "+Math.ceil(infototalCount/10));
      
      Map<String, Object> result = new HashMap<String, Object>();
      result.put("total",totalPages);
      result.put("list", infodao.infoList(pageParam));

      return result;
   }

   
   /*
    * 여행지 정보 상세보기
    */
   public BoardDTO infoDetail(String board_idx, Model model) {
      logger.info("여행지 상세보기 서비스");
      BoardDTO boardDTO = infodao.infoDetail(board_idx);
            
      if(boardDTO != null) {
         infodao.infoUpHit(board_idx);
      }
            
      return boardDTO;
   }

   
   /*
    * 좌표 불러오기
    */
   public LocateDTO call_xy(String board_idx) {
      logger.info("좌표 불러오기 서비스");
      
      return infodao.call_xy(board_idx);
   }

}