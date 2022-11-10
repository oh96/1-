package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.gudi.dto.MypageDTO;

public interface MypageDAO {

	MypageDTO detail(String id);

	int MypageUpdate(HashMap<String, String> params);

	void withdraw(String id);

	ArrayList<HashMap<String, Object>> myreview(String id);

	int MyreviewDeleteList(String board_idx);

	

	


}
