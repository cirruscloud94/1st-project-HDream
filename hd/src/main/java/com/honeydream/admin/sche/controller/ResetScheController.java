package com.honeydream.admin.sche.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.admin.sche.service.ResetScheService;
import com.honeydream.common.domain.CommandMap;

@Controller
public class ResetScheController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="resetScheService")
	private ResetScheService resetScheService;
	
	@RequestMapping("/admin/reset_sche")
    public ModelAndView mainBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");

    	try{
    		resetScheService.resetSche(commandMap.getMap());
    		mv.addObject("result", "success");
    	}catch(Exception e) { mv.addObject("result", "error"); }
    	
    	return mv;
    }
}
