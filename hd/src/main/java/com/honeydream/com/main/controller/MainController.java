package com.honeydream.com.main.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.com.main.service.MainService;
import com.honeydream.common.domain.CommandMap;

@Controller
public class MainController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@RequestMapping(value="/main")
    public ModelAndView mainBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/main");
    	
    	List<Map<String,Object>> list = mainService.mainList(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	
    	return mv;
    }
	
	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public ModelAndView mainSearch( CommandMap commandMap) throws Exception {

	    ModelAndView mv = new ModelAndView("/main");
	    List<Map<String, Object>> list = mainService.mainSearch(commandMap.getMap());
	    
		mv.addObject("search_keyword", commandMap.get("search_keyword") );
		mv.addObject("search_type", commandMap.get("search_type") );
		mv.addObject("print", commandMap.get("print") );
		mv.addObject("print", commandMap.get("print") );
		mv.addObject("list", list);
		
		return mv;
	}
	
//	@RequestMapping(value = "/main", method = RequestMethod.POST)
//	public ModelAndView searchMap( CommandMap commandMap) throws Exception {
//		
//	    ModelAndView mv = new ModelAndView("/main");
//	    List<Map<String, Object>> list = mainService.searchMap(commandMap.getMap());
//		mv.addObject("search_keyword", commandMap.get("search_keyword") );
//		mv.addObject("search_type", commandMap.get("search_type") );
//		mv.addObject("list", list);
//		
//		return mv;
//	}
}
