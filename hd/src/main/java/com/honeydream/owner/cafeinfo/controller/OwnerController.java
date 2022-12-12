package com.honeydream.owner.cafeinfo.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.common.domain.CommandMap;
import com.honeydream.owner.cafeinfo.service.OwnerService;

@Controller
public class OwnerController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="ownerService")
	private OwnerService ownerService;
	
	@RequestMapping(value="/owner/openCafeList")
	public ModelAndView cafeInfoList(Map<String,Object> commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/owner/cafeinfoList");

		List<Map<String,Object>> list = ownerService.selectCafeInfoList(commandMap, session);
		
		mv.addObject("list", list);
		
		return mv;
		
	}
	
	@RequestMapping(value="/owner/openCafeWrite")
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/owner/cafeReg");
		
		return mv;
	}
	
	@RequestMapping(value="/owner/insertCafeinfoTable")
	public ModelAndView insertCafeinfoTable(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/owner/openCafeList");
	
		ownerService.insertCafeinfoTable(commandMap.getMap(), request);
		
		return mv;
	}
	
	
}


























