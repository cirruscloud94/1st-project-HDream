package com.honeydream.admin.user_info.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.admin.user_info.service.UserService;
import com.honeydream.common.domain.CommandMap;

@Controller
public class UserController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="userService")
	private UserService userService;
	
	//회원 목록
	@RequestMapping("/admin/userList")
	public ModelAndView userList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/userList");

		mv.addObject("search", commandMap.getMap());
		Map<String,Object> map = userService.userList(commandMap.getMap());
		mv.addObject("list", map.get("result"));
		mv.addObject("paginationInfo", (PaginationInfo)map.get("paginationInfo"));
		
		return mv;
	}
	
	//회원 상세
	@RequestMapping("/admin/userDetail")
	public ModelAndView userDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		Map<String, Object> map = userService.userDetail(commandMap.getMap());
		map.put("M_REG_DATE", map.get("M_REG_DATE").toString());
		map.put("M_MOD_DATE", map.get("M_MOD_DATE").toString());
		mv.addObject("map", map);
		
		return mv;
	}
	
	//회원 수정
	@RequestMapping("/admin/modifyUser")
	public ModelAndView modifyUser(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		int upcount = userService.modifyUser(commandMap.getMap());
		if(upcount > 0) mv.addObject("result", "success");
		
		return mv;
	}
}
