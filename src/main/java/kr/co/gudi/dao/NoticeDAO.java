package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.gudi.dto.NoticeDTO;
import kr.co.gudi.dto.PhotoNoticeDTO;

public interface NoticeDAO {

	ArrayList<HashMap<String, Object>> list(int offset);

	int totalCount();
	
	
	
	
	
	
	/*ArrayList<NoticeDTO> list();
	
	int write(NoticeDTO dto);

	void fileWrite(int fileIdx, String oriFileName, String newFileName);

	NoticeDTO detail(String idx);

	ArrayList<PhotoNoticeDTO> fileList(String idx);

	void upHit(String idx);*/
	

	

}
