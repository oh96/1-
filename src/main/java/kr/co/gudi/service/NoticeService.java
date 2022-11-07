package kr.co.gudi.service;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;

import kr.co.gudi.dao.NoticeDAO;
import kr.co.gudi.dao.NoticeDAO;
import kr.co.gudi.dto.NoticeDTO;
import kr.co.gudi.dto.PhotoNoticeDTO;

@Service
public class NoticeService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired NoticeDAO dao;
	
	public HashMap<String, Object> list(int page) {
		
		int offset = (page-1)*10;
		
		
	
		int totalCount = dao.totalCount();
		logger.info("total count : "+totalCount);
		
	
		int totalPages = totalCount%10>0 ? (totalCount/10)+1 : (totalCount/10); //총 페이지 수
		logger.info("총 페이지 수 : "+totalPages);
		logger.info("총 페이지 수2 : "+Math.ceil(totalCount/10));
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("total", totalPages);
		result.put("list",dao.list(offset));
		
		return result;
	}

	


}












/*@Service
public class NoticeService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired NoticeDAO dao;
	
	public ArrayList<NoticeDTO> list(){
		return dao.list();
	}

	public String write(MultipartFile photo, HashMap<String, String> params) {
		logger.info("photo 이름 : {}",photo.getOriginalFilename()); 
		
		
		NoticeDTO dto = new NoticeDTO(); 
		dto.setBoard_subject(params.get("board_subject"));
		dto.setId(params.get("id"));
		dto.setBoard_content(params.get("board_content"));
		int success = dao.write(dto);
		int idx = dto.getBoard_idx();
		logger.info("write success :{}",idx);
		//데이터 넣기 성공하고,업로드할 파일이 있다면...
		if(success >0 && !photo.getOriginalFilename().equals("")) {
			// 파일을 업로드하고, photo에 데이터 넣기
			fileUpload(photo,idx);
		}
		
		return "redirect:/detail?idx="+idx;
	}
	
	public void fileUpload(MultipartFile photo, int idx) {
		
		String oriFileName = photo.getOriginalFilename();
		String ext = oriFileName.substring(oriFileName.lastIndexOf(".")); 
		String newFileName = System.currentTimeMillis()+ext; 
		
		try {
			byte[] bytes = photo.getBytes(); 
			
			Path path = Paths.get("C:/upload/"+newFileName);
			Files.write(path, bytes);
			logger.info(newFileName+" UPLOAD OK!");
			
			dao.fileWrite(idx,oriFileName,newFileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void detail(String idx, Model model, String method) {
		NoticeDTO board2 = dao.detail(idx);
		model.addAttribute("board2",board2);
		ArrayList<PhotoNoticeDTO> fileList = dao.fileList(idx);
		model.addAttribute("fileList",fileList);
		if(method.equals("detail")) {
			dao.hit(idx);
		}
	}
}	
	*/
	

