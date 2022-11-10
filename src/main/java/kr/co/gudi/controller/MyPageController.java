package kr.co.gudi.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gudi.dto.MypageDTO;
import kr.co.gudi.service.MyPageService;

@Controller
public class MyPageController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MyPageService mypageservice;
		
	@RequestMapping(value="/MypageDetail")
	public String MypageDetail(Model model,HttpSession session, @RequestParam String id) {
		logger.info("마이페이지 호출:" +id);
		String page = "mypage_detail";
		
		if(session.getAttribute("loginId") != null) {
		
			MypageDTO dto= new MypageDTO();
			dto = mypageservice.detail(id);
			logger.info("확인1:"+dto);
			
			if(dto !=null) {
				model.addAttribute("detail",dto);
			}else {
				model.addAttribute("msg","데이터를 가져오는데 실패");
			}
			if (Integer.parseInt(dto.getUser_grade()) >= 1) {
				page="manager_page";
			}
		}
		else {
			model.addAttribute("msg","로그인 하세요");
			page="loginForm";
		}

		return page;
	}
	
	@RequestMapping(value="/MypageUpdateForm")
	public String MypageUpdateForm(Model model,@RequestParam String id) {
		logger.info("업데이트폼으로 이동완료");
		
		String page="mypage_updateForm";
		
		MypageDTO info = mypageservice.detail(id);
		model.addAttribute("info",info);
		
		return page;
		
	}
	
	@RequestMapping(value="/MypageUpdate")
	public String MypageUpdate(@RequestParam HashMap<String, String> params,HttpServletRequest req,Model model) {
		logger.info("마이업데이트으로 이동완료");
		logger.info("params:{}",params);
		String page = "mypage_updateForm";
		
		String user_name=req.getParameter("user_name");
		String gender=req.getParameter("gender");
		String age=req.getParameter("age");
		String email=req.getParameter("email");
		logger.info(user_name+"/"+gender+"/"+age+"/"+email);
		
		if(user_name.equals("")) {
			logger.info("이름을 입력하세요");
			model.addAttribute("msg","이름을 입력하세요");
			model.addAttribute("info",params);//model은 동시에 날라감
		}else if(gender.equals("")) {
			//logger.info("성별을 입력하세요");
			model.addAttribute("msg","성별을 입력하세요");
			model.addAttribute("info",params);
		}else if(age.equals("")) {
			//logger.info("나이를 입력하세요");
			model.addAttribute("msg","나이를 입력하세요");
			model.addAttribute("info",params);
		}else if(email.equals("")) {
			//logger.info("이메일을 입력하세요");
			model.addAttribute("msg","이메일을 입력하세요");
			model.addAttribute("info",params);
		}else {
			//logger.info("모두 완료");
			mypageservice.MypageUpdate(params);
			model.addAttribute("msg","모두 완료");
			page="redirect:/MypageDetail?id="+params.get("id");
		}
	
		return page;
	}

	
	
	
	@RequestMapping(value="/withdraw")
	public String withdraw(Model model,HttpSession session,@RequestParam String id) {
		
		logger.info(id);
		
		mypageservice.withdraw(id);
		
		session.removeAttribute("loginId");
		/*if(session.getAttribute("loginId")!=null) {
			service.withdraw(params);
			page="redirect:/list";
		}else {
			model.addAttribute("msg","로그인이 필요합니다");
		}*/
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/MyreviewBridge")
	public String MyreviewBridge(@RequestParam String id) {
		//logger.info("MyreviewBridge");
		
		return "mypage_review";
	}

	@RequestMapping(value="/Myreview")
	@ResponseBody
	public HashMap<String, Object> Myreview(@RequestParam String id, @RequestParam int page) {
		//logger.info("테스트");
		logger.info(id);
		logger.info(page+"");
		//HashMap<String, Object> map = new HashMap<String, Object>();
		//ArrayList<HashMap<String, Object>> list = service.Myreview(id);
		//map.put("list", list);
		
		return mypageservice.Myreview(id, page);
	}

	@RequestMapping(value="/MyreviewDelete")
	@ResponseBody
	public HashMap<String, Object> MyreviewDelete
		(@RequestParam(value="MyreviewDeleteList[]") ArrayList<String> MyreviewDeleteList){
		logger.info("list{}",MyreviewDeleteList);
		
		int cnt =mypageservice.MyreviewDelete(MyreviewDeleteList);
		String msg=MyreviewDeleteList.size()+"개 요청중";
		msg +=cnt+"개 삭제 완료";
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("msg", msg);
		
		return map;
	}
	
	@RequestMapping(value="/MyrouteBridge")
	public String MyrouteBridge(@RequestParam String id) {
		//logger.info("나의 경로글 잘넘오왔어여");
		logger.info(id);
		return "mypage_route";
	}
	
	@RequestMapping(value="/Myroute")
	@ResponseBody
<<<<<<< HEAD
	public HashMap<String, Object> Myroute(@RequestParam String id){
=======
	public HashMap<String, Object> Myroute(Model model,@RequestParam String id){
>>>>>>> origin/master
		//logger.info("마이루트 체크요");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> list = mypageservice.Myroute(id);
		
		map.put("list", list);
		
		return map;
	}
	
	@RequestMapping(value="/MyrouteDelete")
	@ResponseBody
	public HashMap<String, Object> MyrouteDelete
		(@RequestParam(value="MyrouteDeleteList[]") ArrayList<String> MyrouteDeleteList){
		logger.info("list{}",MyrouteDeleteList);
		
		int cnt =mypageservice.MyrouteDeleteList(MyrouteDeleteList);
		String msg=MyrouteDeleteList.size()+"개 요청중";
		msg +=cnt+"개 삭제 완료";
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("msg", msg);
	
	return map;
}
	

}
