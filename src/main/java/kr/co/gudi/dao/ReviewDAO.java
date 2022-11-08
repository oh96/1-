package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.gudi.dto.ReviewDTO;

public interface ReviewDAO {

	ArrayList<ReviewDTO> list();

	void reviewWrite(String id, String subject, String content);

	ReviewDTO reviewdetail(String idx);
	


	ReviewDTO reviewUpdateForm(String idx);

	int reviewUpdate(HashMap<String, String> params);

}
