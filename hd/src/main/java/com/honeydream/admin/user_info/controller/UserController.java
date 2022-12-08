package com.honeydream.admin.user_info.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	@GetMapping("/admin/userList")
	public ModelAndView userList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/userList");
		
		List<Map<String,Object>> list = userService.userList();
		mv.addObject("list", list);
		
		return mv;
	}
	
	//회원 상세
	@RequestMapping("/admin/userDetail")
	public ModelAndView userDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		Map<String, Object> map = userService.userDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	//회원 수정
	@RequestMapping("/admin/modifyUser")
	public ModelAndView modifyUser(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		userService.modifyUser(commandMap.getMap());
		
		return mv;
	}
	
	//회원 삭제
	@RequestMapping("/admin/deleteUser")
	public ModelAndView deleteUser(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/userList");
		
		userService.deleteUser(commandMap.getMap());
			
		return mv;
	}

	//회원 검색
	@PostMapping("/admin/userList")
	public ModelAndView selectUserList(CommandMap commandMap) throws Exception {		
		ModelAndView mv = new ModelAndView("/admin/userList");
		System.out.println(commandMap.get("m_del_gb"));
		List<Map<String,Object>> list = userService.selectUserSearch(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
}
