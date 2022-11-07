package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.gudi.dto.NoticeDTO;

public interface NoticeDAO {

	ArrayList<NoticeDTO> list(int offset);

	
	int totalCount();



	
	
}
