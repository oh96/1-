package kr.co.gudi.dao;

<<<<<<< HEAD
public interface RouteDAO {

	String getDoro(Object sight1);

	int routeWrite(String loginId, String title, String content);


=======
import java.util.ArrayList;
import java.util.HashMap;

public interface RouteDAO {

	

	ArrayList<HashMap<String, Object>> routelist(int offset);

	int totalCount1();
>>>>>>> origin/master

}
