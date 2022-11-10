
package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface RouteDAO {

	String getDoro(Object sight1);

	void routeWrite(String loginId1, String title, String content);

	int totalCount();
	
	ArrayList<HashMap<String, Object>> routelist(int offset);
}


