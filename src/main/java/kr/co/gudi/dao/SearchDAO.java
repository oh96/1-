package kr.co.gudi.dao;

import java.util.ArrayList;

import kr.co.gudi.dto.BoardDTO;

public interface SearchDAO {

	ArrayList<BoardDTO> searchList(String searchContent);
	
}
