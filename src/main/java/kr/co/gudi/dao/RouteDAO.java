package kr.co.gudi.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface RouteDAO {

	

	ArrayList<HashMap<String, Object>> routelist(int offset);

	int totalCount1();
}
