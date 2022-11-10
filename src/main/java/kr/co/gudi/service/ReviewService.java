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

	public HashMap<String, Object> list(int page) {
		logger.info("후기 리스트 호출"+page);
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int offset = (page-1)*10;
		int totalCount = reviewDAO.totalCount();
		logger.info("totalCount:"+totalCount);
		int totalPages = totalCount%10 >0 ? (totalCount/10)+1 : (totalCount/10); //총 페이지 수
		//Math.ceil(totalCount/10);
		logger.info(totalPages+"");
		//reviewDAO.list();
		result.put("total", totalPages);
		result.put("list", reviewDAO.list(offset));
		
		return result;
	}

	public void reviewWrite(String id, HashMap<Object, Object> params) {
		logger.info("후기 쓰기 서비스");
		String subject = (String) params.get("subject");
		String content = (String) params.get("content");
		
		reviewDAO.reviewWrite(id, subject, content);
	}

	public ReviewDTO reviewDetail(String board_idx) {
		logger.info("상세보기 요청");
		ReviewDTO dto = reviewDAO.reviewdetail(board_idx);
		
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

	public void reviewDelete(String board_idx) {
		int row = reviewDAO.reviewDelete(board_idx);
		
	}
	
	
	
	
	
}
