package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;

<<<<<<< HEAD
=======
import kr.co.gudi.dto.RouteDTO;


>>>>>>> origin/master
public interface RouteDAO {

	String getDoro(Object sight1);

	void routeWrite(RouteDTO dto);

<<<<<<< HEAD
	int totalCount();
	
	ArrayList<HashMap<String, Object>> routelist(int offset);
}
=======
	void route(int board_idx, Object locationIdx, int routeSeq);

	int totalCount();
>>>>>>> origin/master

	ArrayList<HashMap<String, Object>> routelist(int offset);
	
	RouteDTO routeDetail(String idx);
	
	void hit(String board_idx);

<<<<<<< HEAD
=======
}
>>>>>>> origin/master
