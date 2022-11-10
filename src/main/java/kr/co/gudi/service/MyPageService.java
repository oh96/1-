package kr.co.gudi.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.dao.MypageDAO;
import kr.co.gudi.dto.MypageDTO;

@Service
public class MyPageService {

	@Autowired MypageDAO mypagedao;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public MypageDTO detail(String id) {
		//logger.info("service까지 넘어옴 확인");
		
		return mypagedao.detail(id);
	}
	
	
	public void MypageUpdate(HashMap<String, String> params) {
		int row=mypagedao.MypageUpdate(params);
		logger.info("수정된 행의 갯수:"+row);
		
	}	
	
	public void withdraw(String id) {
		
		mypagedao.withdraw(id);
		
	}

	public HashMap<String, Object> Myreview(String id, int page) {
		//logger.info("list 호출");
		int offset=(page-1)*10;
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		//ArrayList<ReviewDTO> list = dao.Myreview(id);
		//logger.info(list+"");
		int totalCount=mypagedao.totalCount(id);
		logger.info("total count: "+totalCount);
		
		int totalPages = totalCount%10 >0 ?(totalCount/10)+1:(totalCount/10);//총페이지수
		logger.info("총페이지 수: "+totalPages);
		
		result.put("total", totalPages);
		result.put("list", mypagedao.Myreview(id, offset));
		
		return result;
		
	}

	public int MyreviewDelete(ArrayList<String> MyreviewDeleteList) {
		
		int total=0;
		for(String board_idx : MyreviewDeleteList) {
			logger.info("체크요"+board_idx);
			total +=mypagedao.MyreviewDeleteList(board_idx);
		}
		logger.info("총 지운 갯수"+total);
		
		return total;
		
	}


	public ArrayList<HashMap<String, Object>> Myroute(String id) {
		
		return mypagedao.Myroute(id);
	}


	public int MyrouteDeleteList(ArrayList<String> MyrouteDeleteList) {
		
		int total=0;
		for(String board_idx : MyrouteDeleteList) {
			logger.info("체크요"+board_idx);
			total +=mypagedao.MyrouteDeleteList(board_idx);
		}
		logger.info("총 지운 갯수"+total);
		
		return total;
	}


	


	
	
}
