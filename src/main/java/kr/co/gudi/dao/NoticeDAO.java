package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface NoticeDAO {

	ArrayList<HashMap<String, Object>> list(int offset);

	int totalCount();

	
	
}
