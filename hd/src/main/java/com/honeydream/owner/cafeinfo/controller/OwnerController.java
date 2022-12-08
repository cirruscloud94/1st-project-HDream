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
	public ModelAndView cafeInfoList(Map<String,Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/owner/cafeinfoList");
		
		List<Map<String,Object>> list = ownerService.selectCafeInfoList(commandMap);
		
		
		
		
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
	
		String selectbank = (String)commandMap.get("selectbank");
		String bankaccount = (String)commandMap.get("bankaccount");
		String accountinfo = (String)(selectbank + ", " + bankaccount);
		
		commandMap.put("CAFE_ACCOUNTINFO", accountinfo);
		
		HttpSession session = request.getSession(); 
		String cafe_own_id = (String)session.getAttribute("m_id");
		commandMap.put("CAFE_OWN_ID", cafe_own_id);

		ownerService.insertCafeinfoTable(commandMap.getMap(), request);
		
		return mv;
	}
	
	
}



























