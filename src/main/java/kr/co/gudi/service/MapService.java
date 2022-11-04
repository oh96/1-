package kr.co.gudi.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.dao.MapDAO;
import kr.co.gudi.dto.MapDTO;

@Service
public class MapService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MapDAO mapDAO;
	
	public ArrayList<MapDTO> map() {
		logger.info("근처 여행지 찾기 서비스");
		return mapDAO.map();
	}

}
