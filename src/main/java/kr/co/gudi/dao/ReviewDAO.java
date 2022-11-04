package kr.co.gudi.dao;

import java.util.ArrayList;

import kr.co.gudi.dto.ReviewDTO;

public interface ReviewDAO {

	ArrayList<ReviewDTO> list();

	void reviewWrite(String id, String subject, String content);

}
