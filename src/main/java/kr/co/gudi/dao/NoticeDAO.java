package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.gudi.dto.NoticeDTO;
import kr.co.gudi.dto.PhotoDTO;

public interface NoticeDAO {

	/* ArrayList<HashMap<String, Object>> list(int offset); */
	ArrayList<NoticeDTO> list(int offset);
	
	int totalCount();

	NoticeDTO noticedetail(String idx);

	void hit(String idx);

	void noticeWrite(String id, String subject, String content);

	ArrayList<PhotoDTO> fileList(String idx);

	void fileWrite(int fileidx, String oriFileName, String newFileName);

	
	
	
	
	

	

	
	
}
