package kr.co.gudi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/")
	public String main() {
		
		return "main";
	}
	
	@RequestMapping(value="/whatPage")
	public String whatPage(Model model, @RequestParam String page) {
		logger.info("어떤 페이지?");
		logger.info(page);
		
		model.addAttribute("page", page);
		
		return "main";
	}

}
