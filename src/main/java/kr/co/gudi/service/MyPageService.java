package kr.co.gudi.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.gudi.dao.MypageDAO;
import kr.co.gudi.dto.MypageDTO;
import kr.co.gudi.dto.ReviewDTO;

@Service
public class MyPageService {

	@Autowired MypageDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public MypageDTO detail(String id) {
		logger.info("service까지 넘어옴 확인");
		
		return dao.detail(id);
	}

	public void MypageUpdate(HashMap<String, String> params) {
		int row=dao.MypageUpdate(params);
		logger.info("수정된 행의 갯수:"+row);
		
	}

	public void withdraw(String id) {
		
		dao.withdraw(id);
		
	}

	public ArrayList<HashMap<String, Object>> myreview(String id) {
		logger.info("list 호출");
		return dao.myreview(id);
		
	}


	
	
}
