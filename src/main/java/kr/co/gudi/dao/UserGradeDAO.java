package kr.co.gudi.dao;

import java.util.HashMap;

public interface UserGradeDAO {
   
   HashMap<String, Object> userGradePopup(String userId);

   int userGradeUpdate(String userId,String userGrade, String userState);
}