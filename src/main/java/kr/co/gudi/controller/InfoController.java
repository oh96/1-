package kr.co.gudi.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gudi.dto.BoardDTO;
import kr.co.gudi.service.InfoService;

@Controller
public class InfoController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired InfoService service;

	
	/*
	 * 글쓰기 
	 */
	@RequestMapping(value = "/infoWriteForm")
	public String infoWriteForm(Model model) {
		return "infoWriteForm";
	}

	@RequestMapping(value = "/infoWrite")
	public String infoWrite(Model model, HttpServletRequest req,@RequestParam(value="id", required=false) String id,@RequestParam HashMap<String, String> params) {
		logger.info("params: " + params);
		HttpSession session = req.getSession();
		id = (String) session.getAttribute("loginId");
		logger.info(id);
		/*
		String loc_idx=params.get("loc_idx");
		String title=params.get("title");
		String content=params.get("content");
		*/
		service.infoWrite(id, params);
		
		/*
		if(session.getAttribute("loginId") != null) {
			ArrayList<> list = service.list();
			map.put("list", list);
			map.put("login", true);
		}else {
			map.put("login", false);
			// model.addAttribute("msg","로그인이 필요한 서비스입니다."); -> 이렇게 직접 문구를 주는 코드는 잘 사용하지 않는다.(바꿀 때 마다 서버를 건드려야 하기 때문)
		}
		*/
		
		return "redirect:/";
	}

	
	/*
	 * 여행지 리스트 
	 */
	@RequestMapping(value="/placeInfo")
	public String placeInfo() {
		return "placeInfo";
	}
	
	@RequestMapping(value="/placeInfoList")
	@ResponseBody
	public HashMap<String, Object> placeInfoList() {
		logger.info("여행지 정보 리스트 컨트롤러");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<BoardDTO> list = service.placeInfoList();
		map.put("list", list);
		logger.info("list: "+list);
		
		return map;
	}
	
	
	/*
	 * 여행지 상세보기 
	 */
	@RequestMapping(value="/infoDetail")
	public String infoDetail() {
		
		return null;
	}
	
	
	/*
	 * 팝업 리스트
	 */
	@RequestMapping(value="/infoList")
	public String infoList() {
		return "infoList";
	}
	
	@RequestMapping(value = "/infoListPop")
	@ResponseBody
	public Map<String, Object> infoListPop(@RequestParam int page){
		logger.info("리스트 요청: "+page);

		return service.infoListPop(page);
	}

	
	/*
	 * 여행지 검색 
	 */
	@RequestMapping(value="/searchPlace", method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> searchPlace(HttpServletRequest req) {
		
		// List<LocateDTO> locateList = new ArrayList<LocateDTO>();
		String keyword = req.getParameter("keyword");
		logger.info(keyword);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", service.searchPlace(keyword));
		
		return map;
	}
	
	
	
	/*
	 * 글 수정 
	 */
	/*
	@RequestMapping(value="/infoUpdateForm")
	public String infoUpdateForm(Model model, @RequestParam String idx) {
		service.detail(idx,model,"infoUpdateForm");
		return "infoUpdateForm";
	}
	
	
	@RequestMapping(value="/infoUpdate")
	public String infoUpdate(Model model, MultipartFile photo, @RequestParam HashMap<String, String> params) {
		
		return service.infoUpdate(photo,params);
	}
	*/
	
}


