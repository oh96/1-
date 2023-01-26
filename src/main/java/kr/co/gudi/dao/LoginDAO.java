package kr.co.gudi.dao;

import java.util.HashMap;

import kr.co.gudi.dto.UserDTO;

public interface LoginDAO {

   UserDTO login(String id, String password);

   String loginchk(String id);
   
   String loginStop(String id);
   

}