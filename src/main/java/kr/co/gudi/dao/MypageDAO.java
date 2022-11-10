package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.gudi.dto.MypageDTO;

public interface MypageDAO {

	MypageDTO detail(String id);

	int MypageUpdate(HashMap<String, String> params);

	void withdraw(String id);

	ArrayList<ReviewDTO> Myreview(String id, int offset);

	int totalCount(String id);

	int MyreviewDeleteList(String board_idx);

	ArrayList<HashMap<String, Object>> Myroute(String id);

	int MyrouteDeleteList(String board_idx);


	

	


}
