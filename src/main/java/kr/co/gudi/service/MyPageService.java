package kr.co.gudi.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.gudi.dao.MypageDAO;
import kr.co.gudi.dto.MypageDTO;

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

	public void myreview(String id) {
		
		dao.myreview(id);
		
	}


	
	
}
