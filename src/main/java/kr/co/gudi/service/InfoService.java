package kr.co.gudi.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gudi.dao.InfoDAO;
import kr.co.gudi.dto.BoardDTO;
import kr.co.gudi.dto.InfoDTO;
import kr.co.gudi.dto.LocateDTO;

@Service
public class InfoService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired InfoDAO dao;

	/*
	 * 글쓰기 
	 */
	public void infoWrite(String id, HashMap<String, String> params) {

		logger.info("infoWrite 호출"); // 파일 업로드가 없어도 null 이 아니다.
		InfoDTO dto = new InfoDTO();

		dto.setId(id);
		dto.setBoard_subject(params.get("title"));
		dto.setBoard_content(params.get("content"));
		
		String loc_idx=params.get("loc_idx");
		
		dao.infoWrite(dto);
		int board_idx = dto.getBoard_idx();
		logger.info("write success: {}",board_idx);
		
		trip_info(board_idx,loc_idx);

	}

	private void trip_info(int board_idx,String loc_idx) {
		dao.trip_info(board_idx,loc_idx);
	}

	private void fileUpload(MultipartFile photo, int idx) {
		String oriFileName = photo.getOriginalFilename(); 
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		String newFileName = System.currentTimeMillis()+ext;
		
		try {
			/*
			 * byte[] bytes = photo.getBytes();
			 * 
			 * Path path = Paths.get("C:/upload/"+newFileName); Files.write(path, bytes);
			 * logger.info(newFileName+" UPLOAD OK");
			 */

			dao.fileWrite(idx,oriFileName,newFileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	/*
	 * 팝업 리스트
	 */
	public Map<String, Object> infoListPop(int page) {
		logger.info("list 호출");
		Map<String, Object> pageParam = new HashMap<String, Object>();

		int offset = (page-1)*10;
		pageParam.put("offset", offset);
		
		int totalCount = dao.totalCount();
		logger.info("totalcount: "+totalCount);
		
		int totalPages = totalCount%10 > 0 ? (totalCount/10)+1 : (totalCount/10);
		logger.info("총 페이지 수: "+totalPages);
		logger.info("총 페이지 수 2: "+Math.ceil(totalCount/10));
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("total",totalPages);
		result.put("list", dao.infoListPop(pageParam));

		return result;

	}

	
	/*
	 * 여행지 검색 
	 */
	public List<LocateDTO> searchPlace(String keyword) {
		//Map<String, Object> map = new HashMap<String, Object>();
		//map.put("list", dao.searchPlace(keyword));
		
		return dao.searchPlace(keyword);
	}

	
	/*
	 * 글 수정 
	 */
	public String infoUpdate(MultipartFile photo, HashMap<String, String> params) {
		logger.info("photo 이름: {}",photo.getOriginalFilename());
		
		int success = dao.infoUpdate(params);
		String idx = params.get("idx");

		if(success > 0 && !photo.getOriginalFilename().equals("")) {
			fileUpload(photo,Integer.parseInt(idx));
		}
		return "redirect:/detail?idx="+idx;
	}

	public ArrayList<BoardDTO> placeInfoList() {
		logger.info("여행지 정보 리스트 서비스");
		return dao.placeInfoList();
	}


}
