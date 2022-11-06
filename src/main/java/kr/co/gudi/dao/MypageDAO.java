package kr.co.gudi.dao;

import java.util.HashMap;

import kr.co.gudi.dto.MypageDTO;

public interface MypageDAO {

	MypageDTO detail(String id);

	int MypageUpdate(HashMap<String, String> params);

	int withdraw(HashMap<String, String> params);


}
