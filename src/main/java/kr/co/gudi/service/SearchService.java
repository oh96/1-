package kr.co.gudi.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.dao.SearchDAO;
import kr.co.gudi.dto.BoardDTO;

@Service
public class SearchService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SearchDAO searchDAO;

	public HashMap<String, Object> searchList(String searchContent, int page) {
		logger.info("전체 검색 서비스");
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int offset = (page-1)*10;
	    int totalCount = searchDAO.totalCount(searchContent);
	    logger.info("totalCount:"+totalCount);
	    int totalPages = totalCount%10 >0 ? (totalCount/10)+1 : (totalCount/10); //총 페이지 수
	    logger.info(totalPages+"");
	    result.put("total", totalPages);
	    result.put("list", searchDAO.searchList(searchContent, offset));
		
		return result;
	}

	public HashMap<String, Object> detailSearch(String detailContent, String sl1, String sl2, int page) {
		logger.info("상세 검색 서비스");
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		HashMap<String, Object> result = new HashMap<String, Object>();
		int offset = (page-1)*10;
		int totalCount = 0;
		
		if(sl1.equals("통합")) {
			
			if(sl2.equals("전체")) {
				list = searchDAO.detailSearch11(detailContent, offset);
				totalCount = searchDAO.total11(detailContent);
			}else if(sl2.equals("제목")) {
				list = searchDAO.detailSearch12(detailContent, offset);
				totalCount = searchDAO.total12(detailContent);
			}else if(sl2.equals("작성자")) {
				list = searchDAO.detailSearch13(detailContent, offset);
				totalCount = searchDAO.total13(detailContent);
			}
			
		}else if(sl1.equals("여행지 정보")) {
			
			if(sl2.equals("전체")) {
				list = searchDAO.detailSearch21(detailContent, offset);
				totalCount = searchDAO.total21(detailContent);
			}else if(sl2.equals("제목")) {
				list = searchDAO.detailSearch22(detailContent, offset);
				totalCount = searchDAO.total22(detailContent);
			}else if(sl2.equals("작성자")) {
				list = searchDAO.detailSearch23(detailContent, offset);
				totalCount = searchDAO.total23(detailContent);
			}
			
		}else if(sl1.equals("여행지 후기")) {
			
			if(sl2.equals("전체")) {
				list = searchDAO.detailSearch31(detailContent, offset);
				totalCount = searchDAO.total31(detailContent);
			}else if(sl2.equals("제목")) {
				list = searchDAO.detailSearch32(detailContent, offset);
				totalCount = searchDAO.total32(detailContent);
			}else if(sl2.equals("작성자")) {
				list = searchDAO.detailSearch33(detailContent, offset);
				totalCount = searchDAO.total33(detailContent);
			}
			
		}else if(sl1.equals("여행지 경로")) {
			
			if(sl2.equals("전체")) {
				list = searchDAO.detailSearch41(detailContent, offset);
				totalCount = searchDAO.total41(detailContent);
			}else if(sl2.equals("제목")) {
				list = searchDAO.detailSearch42(detailContent, offset);
				totalCount = searchDAO.total42(detailContent);
			}else if(sl2.equals("작성자")) {
				list = searchDAO.detailSearch43(detailContent, offset);
				totalCount = searchDAO.total43(detailContent);
			}
		}
		
		
		logger.info(totalCount+"dd");
	    int totalPages = totalCount%10 >0 ? (totalCount/10)+1 : (totalCount/10); //총 페이지 수
	    logger.info(totalPages+"tt");
	    result.put("list", list);
	    result.put("total", totalPages);
	    
		return result;
	}

}
