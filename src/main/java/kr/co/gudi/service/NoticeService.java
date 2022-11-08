package kr.co.gudi.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gudi.dao.NoticeDAO;
import kr.co.gudi.dto.NoticeDTO;
import kr.co.gudi.dto.PhotoDTO;

@Service
public class NoticeService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired NoticeDAO dao;
	
	/*
	 * public HashMap<String, Object> list(int page){ logger.info("공지 리스트 호출");
	 * return dao.list(); }
	 */
	
	
	public HashMap<String, Object> list(int page) {
		
		int offset = (page-1)*10;
		int totalCount = dao.totalCount();
		logger.info("total count : "+totalCount);
		
		
		int totalPages=totalCount/10; 
		if(totalCount%10>0) {
			totalPages=(totalCount/10)+1;
		}
		logger.info("총 페이지 수 : "+totalPages);
		logger.info("총 페이지 수2 : "+Math.ceil(totalCount/10));
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("total", totalPages);
		result.put("list",dao.list(offset));
		
		return result;
	}

	/*public String noticedetail(String idx) {
		logger.info("공지 상세보기");
		// NoticeDTO dto = dao.noticedetail(idx);
		if(idx!=null) { 
			dao.hit(idx);
		}		
		return dao.noticedetail(idx);
		
	}*/

	public void noticeWrite(String id, HashMap<String, String> params) {
		logger.info("공지 쓰기 서비스");
		String subject = params.get("subject");
		String content = params.get("content");
		
		dao.noticeWrite(id, subject, content);
	}
	
	public void fileUpload(MultipartFile photo, int idx) {
		String oriFileName = photo.getOriginalFilename();
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		String newFileName = System.currentTimeMillis()+ext;
		

		try {
			byte[] bytes = photo.getBytes(); //2-1 파일 바이너리 얻어내기
			//2-2 특정경로에 파일 쓰기
			Path path = Paths.get("C:/upload/"+newFileName);
			Files.write(path, bytes);
			logger.info(newFileName+" UPLOAD OK! ");
			//dao를 이용해서 photo테이블에 데이터 넣기
			dao.fileWrite(idx,oriFileName,newFileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void noticedetail(String idx, Model model, String method) {
		NoticeDTO board = dao.noticedetail(idx);
		model.addAttribute("board",board);
		ArrayList<PhotoDTO> fileList = dao.fileList(idx);
		model.addAttribute("fileList",fileList);
		if(method.equals("noticedetail")) {
			dao.hit(idx);
		}
		
	}
	
}
