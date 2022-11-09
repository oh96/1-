package kr.co.gudi.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.dao.SearchDAO;
import kr.co.gudi.dto.BoardDTO;

@Service
public class SearchService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SearchDAO searchDAO;

	public ArrayList<BoardDTO> searchList(String searchContent) {
		logger.info("전체 검색 서비스");
		
		return searchDAO.searchList(searchContent);
	}

}
