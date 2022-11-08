package kr.co.gudi.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.dao.ReviewDAO;
import kr.co.gudi.dto.ReviewDTO;

@Service
public class ReviewService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ReviewDAO reviewDAO;

	public ArrayList<ReviewDTO> list() {
		logger.info("후기 리스트 호출");
		
		return reviewDAO.list();
	}

	public void reviewWrite(String id, HashMap<String, String> params) {
		logger.info("후기 쓰기 서비스");
		String subject = params.get("subject");
		String content = params.get("content");
		
		reviewDAO.reviewWrite(id, subject, content);
	}

	public ReviewDTO reviewDetail(String idx) {
		logger.info("상세보기 요청");
		ReviewDTO dto = reviewDAO.reviewdetail(idx);
		return dto;
	}

	public ReviewDTO reviewUpdateForm(String board_idx) {
		logger.info("수정 상세 보기 요청");
		return reviewDAO.reviewdetail(board_idx);
	}

	public  void reviewUpdate(HashMap<String, String> params) {
		int row = reviewDAO.reviewUpdate(params);
		logger.info("수정된 행의 갯수:"+row);
	}
	
	
	
	
	
}
