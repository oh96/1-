package kr.co.gudi.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.RequestScope;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import kr.co.gudi.dto.MypageDTO;
import kr.co.gudi.service.MyPageService;

@Controller
public class MyPageController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MyPageService service;
		
	@RequestMapping(value="/MypageDetail")
	public String MypageDetail(Model model,HttpSession session, @RequestParam String id) {
		logger.info("마이페이지 호출:" +id);
		
		if(session.getAttribute("loginId") != null) {
		
			MypageDTO dto= new MypageDTO();
			dto = service.detail(id);
			logger.info("확인1:"+dto);
			
			if(dto !=null) {
				model.addAttribute("detail",dto);
			}else {
				model.addAttribute("msg","데이터를 가져오는데 실패");
			}
		}
		else {
			model.addAttribute("msg","로그인 하세요");
		}

		return "mypage_detail";
	}
	
	@RequestMapping(value="/MypageUpdateForm")
	public String MypageUpdateForm(Model model,@RequestParam String id) {
		logger.info("업데이트폼으로 이동완료");
		
		String page="mypage_updateForm";
		
		MypageDTO info = service.detail(id);
		model.addAttribute("info",info);
		
		return page;
		
	}
	
	@RequestMapping(value="/MypageUpdate")
	public String MypageUpdate(@RequestParam HashMap<String, String> params) {
		logger.info("마이업데이트으로 이동완료");
		logger.info("params:{}",params);
		service.MypageUpdate(params);
	
		return "redirect:/MypageDetail?id="+params.get("id");
	}
	
	@RequestMapping(value="/withdraw")
	public String withdraw(Model model,HttpSession session,@RequestParam String id) {
		
		logger.info(id);
		
		service.withdraw(id);
		
		
		/*if(session.getAttribute("loginId")!=null) {
			service.withdraw(params);
			page="redirect:/list";
		}else {
			model.addAttribute("msg","로그인이 필요합니다");
		}*/
		
		return "redirect:/";
	}
	

}
