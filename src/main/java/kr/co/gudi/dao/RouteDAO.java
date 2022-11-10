package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.gudi.dto.RouteDTO;


public interface RouteDAO {

	String getDoro(Object sight1);

	void routeWrite(RouteDTO dto);

	void route(int board_idx, Object locationIdx, int routeSeq);

	int totalCount();

	ArrayList<HashMap<String, Object>> routelist(int offset);
	
	RouteDTO routeDetail(String idx);
	
	void hit(String board_idx);

}
