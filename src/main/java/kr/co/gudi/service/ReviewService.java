package kr.co.gudi.service;

import java.util.ArrayList;

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
}
