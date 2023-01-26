package kr.co.gudi.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gudi.dao.NoticeDAO;
import kr.co.gudi.dto.BlindDTO;
import kr.co.gudi.dto.BoardDTO;
import kr.co.gudi.dto.NoticeDTO;
import kr.co.gudi.dto.PhotoDTO;
import kr.co.gudi.dto.UserDTO;

@Service
public class NoticeService {

   Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @Autowired NoticeDAO noticedao;
   
   public HashMap<String, Object> noticeList(int page) {
      logger.info("공지 리스트 호출"+page);
      HashMap<String, Object> result = new HashMap<String, Object>();
      
      int offset = (page-1)*10;
      int totalCount = noticedao.totalCount();
      logger.info("total count : "+totalCount);
      int totalPages = totalCount%10 >0 ? (totalCount/10)+1 : (totalCount/10);
      logger.info(totalPages+"");
      result.put("total", totalPages);
      result.put("noticeList",noticedao.noticeList(offset));
      
      return result;
   }

   
   public HashMap<String, Object> userlist(int userpage) {
      logger.info("유저리스트호출"+userpage);
      HashMap<String, Object> result = new HashMap<String, Object>();
      int offset = (userpage-1)*10;
      int totalCount = noticedao.userTotalCount();
      logger.info("total count : "+totalCount);
      
      int totalPages = totalCount%10 >0 ? (totalCount/10)+1 : (totalCount/10);
      logger.info(totalPages+"");
      
      result.put("total", totalPages);
      result.put("userList",noticedao.userlist(offset));
      
      return result;
   }

   public void noticeWrite(String id, HashMap<String, String> params) {
      logger.info("공지 쓰기 서비스");
      NoticeDTO dto = new NoticeDTO();
      
      dto.setId(id);
      dto.setBoard_subject(params.get("subject"));
      dto.setBoard_content(params.get("content"));
      
      String fixed=params.get("fixed");
      
      noticedao.noticeWrite(dto);
      int board_idx = dto.getBoard_idx();
      logger.info("write success : {}",board_idx);
      
      notice(board_idx,fixed);
   }
   
   
   private void notice(int board_idx, String fixed) {
      noticedao.notice(board_idx,fixed);
   }
   
   public void fileUpload(MultipartFile photo, int idx) {
      String oriFileName = photo.getOriginalFilename();
      String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
      String newFileName = System.currentTimeMillis()+ext;
      
      try {
         byte[] bytes = photo.getBytes();
         
         Path path = Paths.get("C:/upload/"+newFileName);
         Files.write(path, bytes);
         logger.info(newFileName+" UPLOAD OK! ");
         
         noticedao.fileWrite(idx,oriFileName,newFileName);
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   public BoardDTO noticedetail(String board_idx, Model model) {
      logger.info("상세보기 서비스");
      BoardDTO boarddto = noticedao.noticedetail(board_idx);
         if(boarddto !=null) {
            noticedao.hit(board_idx);
         }
         return boarddto;
   }
      
      
      
   public void noticeupdate(HashMap<String,String> params, String id) {
      logger.info("공지수정 서비스");
      String board_idx = params.get("board_idx");
      String board_subject = params.get("board_subject");
      String board_content = params.get("board_content");
      logger.info(board_idx+'/'+board_subject+'/'+board_content);
      noticedao.noticeupdate(board_idx,board_subject,board_content,id);
   }
    
   
   //관리자페이지-여행지정보리스트
   public int AdminInfoPhotoDelete(ArrayList<String> AdminInfoPhotoDeleteList) {
        
        int total=0; 
        for(String board_idx : AdminInfoPhotoDeleteList) {
           logger.info("체크요"+board_idx); 
           total +=noticedao.AdminInfoPhotoDelete(board_idx);
           AdminTripInfoDelete(board_idx); 
           AdminInfoDelete(board_idx);
        } 
        
        logger.info("총 지운 갯수"+total);
        return total;
        
        }

        
   
   private void AdminTripInfoDelete(String board_idx) {
      
      noticedao.AdminTripInfoDelete(board_idx);
   }
        
        

        
        
      private void AdminInfoDelete(String board_idx) {
         noticedao.AdminInfoDelete(board_idx);
   }


      private void adminReviewDeleteBoardTable(String board_idx) {
         noticedao.adminReviewDeleteBoardTable(board_idx); }

        
        /*관리자 페이지에서 정보 불러오기*/
      public HashMap<String, Object> admininfolist(int page) {
         logger.info("관리자 여행지정보리스트호출"+page);
         HashMap<String, Object> param = new HashMap<String, Object>();
         
         int offset = (page-1)*10;
         param.put("offset",offset);
         
         int totalCount = noticedao.AdminInfototalCount();
         logger.info("total count : "+totalCount);
         
         int totalPages = totalCount%10 > 0 ? (totalCount/10)+1 : (totalCount/10);
         logger.info(totalPages+"");
         
         HashMap<String, Object> result = new HashMap<String, Object>();
         List<BoardDTO> list = noticedao.AdminInfoList(offset);
         result.put("total", totalPages);
         result.put("admininfolist", list);
         
         return result;
      }


      public HashMap<String, Object> allListCall(int page) {
         logger.info("전체리스트호출"+page);
         HashMap<String, Object> result = new HashMap<String, Object>();
         int offset = (page-1)*10;
         int totalCount = noticedao.allTotalCount();
         logger.info("total count : "+totalCount);
         
         int totalPages = totalCount%10 >0 ? (totalCount/10)+1 : (totalCount/10);
         logger.info(totalPages+"");
         
         result.put("total", totalPages);
         result.put("allList",noticedao.allList(offset));
         
         return result;
      }


      public HashMap<String, Object> getInfo() {
         
         HashMap<String, Object> result = new HashMap<String, Object>();
         ArrayList<HashMap<String, Object>> Info = noticedao.blindInfo();
         result.put("list", Info);
         logger.info(Info+"");
         
         return result;
      }


      public int AdminBlindDelete(ArrayList<String> AdminBlindDeleteList) {
           
           int total=0; 
           for(String blind_idx : AdminBlindDeleteList) {
              logger.info("체크요"+blind_idx); 
              total +=noticedao.AdminBlindDelete(blind_idx);
              AdminTripInfoDelete(blind_idx); 
              AdminInfoDelete(blind_idx);
           } 
           
           logger.info("총 지운 갯수"+total);
           return total;
           
           }
   

   
   
}