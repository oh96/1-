package kr.co.gudi.dao;

import java.util.ArrayList;

import kr.co.gudi.dto.BoardDTO;

public interface SearchDAO {

	ArrayList<BoardDTO> searchList(String searchContent, int page);

	int totalCount(String searchContent);

	ArrayList<BoardDTO> detailSearch11(String detailContent, int offset);

	ArrayList<BoardDTO> detailSearch12(String detailContent, int offset);

	ArrayList<BoardDTO> detailSearch13(String detailContent, int offset);

	ArrayList<BoardDTO> detailSearch21(String detailContent, int offset);

	ArrayList<BoardDTO> detailSearch22(String detailContent, int offset);

	ArrayList<BoardDTO> detailSearch23(String detailContent, int offset);

	ArrayList<BoardDTO> detailSearch31(String detailContent, int offset);

	ArrayList<BoardDTO> detailSearch32(String detailContent, int offset);

	ArrayList<BoardDTO> detailSearch33(String detailContent, int offset);

	ArrayList<BoardDTO> detailSearch41(String detailContent, int offset);

	ArrayList<BoardDTO> detailSearch42(String detailContent, int offset);

	ArrayList<BoardDTO> detailSearch43(String detailContent, int offset);

	int totalCnt(String detailContent);

	int total11(String detailContent);

	int total12(String detailContent);

	int total13(String detailContent);

	int total21(String detailContent);

	int total22(String detailContent);

	int total23(String detailContent);

	int total31(String detailContent);

	int total32(String detailContent);

	int total33(String detailContent);

	int total41(String detailContent);

	int total42(String detailContent);

	int total43(String detailContent);
	
}
