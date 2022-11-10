package kr.co.gudi.dao;

import kr.co.gudi.dto.UserDTO;

public interface LoginDAO {

	UserDTO login(String id, String password);

	String loginchk(String id);

}
