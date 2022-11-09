package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.gudi.dto.ReviewDTO;

public interface ReviewDAO {

	ArrayList<HashMap<String, Object>> list(int offset);

	int reviewWrite(String id, String board_subject, String board_content);

	ReviewDTO reviewdetail(String idx);
	


	ReviewDTO reviewUpdateForm(String idx);

	int reviewUpdate(HashMap<String, String> params);

	int reviewDelete(String board_idx);

	int totalCount();

}
