package com.honeydream.com.board;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping("/board")
	public ModelAndView boardList() throws Exception{
		ModelAndView mv = new ModelAndView("/board/list");
		
		return mv;
	}
}