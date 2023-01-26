package kr.co.gudi.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.dao.UserGradeDAO;

@Service
public class UserGradeService {
   
   Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @Autowired UserGradeDAO userGradeDAO;

   public HashMap<String, Object> userGradePopup(String userId) {
      
      return userGradeDAO.userGradePopup(userId);
   }
   
   
   
   public int userGradeUpdate(String userId,String gradeState) {
      
      String userGrade = "";
      String userState = "";
      
      if(gradeState.equals("1")) {
         userGrade = "0";
         userState = "정상";
      }else if(gradeState.equals("2")) {
         userGrade = "0";
         userState = "정지";
      }else if(gradeState.equals("3")) {
         userGrade = "1";
         userState = "정상";
      }
      logger.info(userGrade+"/"+userState);
      logger.info("gradeState: "+gradeState);
      
      return userGradeDAO.userGradeUpdate(userId,userGrade,userState);
   }

}