package kr.co.gudi.service;


import java.util.HashMap;

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

   public void routeWrite(Object[] locationIdx, String loginId, String title, String content) {
      
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
   }
   

   private void route(int board_idx, Object locationIdx, int routeSeq) {
      routeDAO.route(board_idx, locationIdx, routeSeq);
      
   }
   
   public  HashMap<String, Object> routelist(int page) {
         logger.info("후기 리스트 호출"+page);
         HashMap<String, Object> result = new HashMap<String, Object>();
         
         int offset = (page-1)*10;
         int totalCount = routeDAO.totalCount();
         logger.info("totalCount:"+totalCount);
         int totalPages = totalCount%10 >0 ? (totalCount/10)+1 : (totalCount/10); //총 페이지 수
         //Math.ceil(totalCount/10);
         logger.info(totalPages+"");
         //reviewDAO.list();
         result.put("total", totalPages);
         result.put("routelist", routeDAO.routelist(offset));
         
         return result;
      }
   
   
   public RouteDTO routeDetail(String board_idx) {
      logger.info("상세보기 요청");
      RouteDTO routeDTO = routeDAO.routeDetail(board_idx);
      
      if (routeDTO != null) {
         routeDAO.hit(board_idx);
      }
      return routeDTO;
   }

}