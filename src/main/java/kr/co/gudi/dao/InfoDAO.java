package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.gudi.dto.BoardDTO;
import kr.co.gudi.dto.InfoDTO;
import kr.co.gudi.dto.LocateDTO;

public interface InfoDAO {

	void infoWrite(InfoDTO dto);
	
	void trip_info(int idx, String loc_idx);
	
	void fileWrite(int idx, String oriFileName, String newFileName);

	List<Map<String, Object>> infoListPop(Map pageParam);

	int totalCount();

	List<LocateDTO> searchPlace(String keyword);

	ArrayList<BoardDTO> infoList();

	BoardDTO infoDetail(String board_idx);

	LocateDTO call_xy(String board_idx);

	void infoUpdate(String board_idx, String board_subject, String board_content, String id);
	
}
