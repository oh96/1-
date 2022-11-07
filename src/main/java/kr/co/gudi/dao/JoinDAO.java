package kr.co.gudi.dao;

public interface JoinDAO {

	int join(String id, String password, String user_name, String age, String gender, String email);

	String overlay(String id);

}
