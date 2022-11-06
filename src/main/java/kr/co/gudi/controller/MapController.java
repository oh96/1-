package kr.co.gudi.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gudi.dto.MapDTO;
import kr.co.gudi.service.MapService;

@Controller
public class MapController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MapService mapService;
	
	@RequestMapping(value="/map")
	public String map() {
		logger.info("근처 여행지 찾기 요청");
		
		return "map";
	}
	
	@RequestMapping(value="/markCall")
	@ResponseBody
	public HashMap<String, Object> markCall() {
		logger.info("마커 부르기 요청");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<MapDTO> mapList = mapService.map();
		map.put("mapList", mapList);
		
		return map;
	}
}
