package com.honeydream;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.common.domain.CommandMap;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SampleController {
	
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	
	//샘플 UI를 보기 위한 컨트롤러
	@RequestMapping("/sample")
	public ModelAndView sample(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("/sample");
		logger.info("Welcome home! The client locale is {}.");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("serverTime", formattedDate );
		mv.addObject("search_type", commandMap.get("search_type"));
		mv.addObject("search_keyword", commandMap.get("search_keyword"));
		return mv;
	}
	@RequestMapping(value={"/sample/{page}", "{page}/sample"})
	public ModelAndView sample(@PathVariable String page, CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("/sample");
		logger.info("Welcome home! The client locale is {}.");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("serverTime", formattedDate );
		mv.addObject("search_type", commandMap.get("search_type"));
		mv.addObject("search_keyword", commandMap.get("search_keyword"));
		mv.addObject("page", page);
		return mv;
	}
	
}
