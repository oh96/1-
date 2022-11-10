package kr.co.gudi.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gudi.dao.InfoDAO;
import kr.co.gudi.dto.BoardDTO;
import kr.co.gudi.dto.InfoDTO;
import kr.co.gudi.dto.LocateDTO;

@Service
public class InfoService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired InfoDAO infodao;

	/*
	 * 글쓰기 
	 */
	public void infoWrite(String id, HashMap<String, String> params) {

		logger.info("infoWrite 호출"); // 파일 업로드가 없어도 null 이 아니다.
		InfoDTO infodto = new InfoDTO();

		infodto.setId(id);
		infodto.setBoard_subject(params.get("title"));
		infodto.setBoard_content(params.get("content"));
		
		String loc_idx=params.get("loc_idx");
		
		infodao.infoWrite(infodto);
		int board_idx = infodto.getBoard_idx();
		logger.info("write success: {}",board_idx);
		
		trip_info(board_idx,loc_idx);

	}

	private void trip_info(int board_idx,String loc_idx) {
		infodao.trip_info(board_idx,loc_idx);
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

			infodao.fileWrite(idx,oriFileName,newFileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	/*
	 * 글 수정 
	 */
	public void infoUpdate(MultipartFile photo, HashMap<String, String> params, String id) {
		logger.info("수정 서비스");
		String board_idx = params.get("board_idx");
		String board_subject = params.get("title");
		String board_content = params.get("content");
		String loc_idx = params.get("loc_idx");
		logger.info(board_idx+'/'+board_subject+'/'+board_content);
		logger.info("service id: "+id);
		infodao.infoUpdate(board_idx,board_subject,board_content,id);
		
		trip_infoUpdate(board_idx,loc_idx);

	}

	
	private void trip_infoUpdate(String board_idx, String loc_idx) {
		infodao.trip_infoUpdate(board_idx,loc_idx);
		
	}

	/*
	 * 팝업 리스트
	 */
	public Map<String, Object> infoListPop(int page) {
		logger.info("list 호출");
		Map<String, Object> pageParam = new HashMap<String, Object>();

		int offset = (page-1)*10;
		pageParam.put("offset", offset);
		
		int totalCount = infodao.totalCount();
		logger.info("totalcount: "+totalCount);
		
		int totalPages = totalCount%10 > 0 ? (totalCount/10)+1 : (totalCount/10);
		logger.info("총 페이지 수: "+totalPages);
		logger.info("총 페이지 수 2: "+Math.ceil(totalCount/10));
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("total",totalPages);
		result.put("list", infodao.infoListPop(pageParam));

		return result;

	}

	
	/*
	 * 여행지 검색 
	 */
	public List<LocateDTO> searchPlace(String keyword) {
		//Map<String, Object> map = new HashMap<String, Object>();
		//map.put("list", dao.searchPlace(keyword));
		
		return infodao.searchPlace(keyword);
	}

	
	/*
	 * 여행지 정보 리스트 
	 */
	public ArrayList<BoardDTO> infoList() {
		logger.info("여행지 정보 리스트 서비스");
		return infodao.infoList();
	}

	
	/*
	 * 여행지 정보 상세보기
	 */
	public BoardDTO infoDetail(String board_idx) {
		logger.info("여행지 상세보기 서비스");
		
		return infodao.infoDetail(board_idx);
	}

	
	/*
	 * 좌표 불러오기
	 */
	public LocateDTO call_xy(String board_idx) {
		logger.info("좌표 불러오기 서비스");
		
		return infodao.call_xy(board_idx);
	}



}
