package com.honeydream.user.mypage.user_info.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.common.domain.CommandMap;
import com.honeydream.user.mypage.user_info.service.UserInfoService;

@Controller
public class UserInfoController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="userInfoService")
	private UserInfoService userInfoService;
	
	@RequestMapping(value="/user/mypage/info/userInfo")
	public ModelAndView selectUserInfo(CommandMap commandMap , HttpSession session) throws Exception {
		
		//session.setAttribute("m_id", "ab9943"); //★나중에 공유 시에는 지워줄 것!!★
		ModelAndView m = new ModelAndView("user/mypage/info/userInfo"); //jsp의 이름
		Map<String,Object> userInfo = userInfoService.selectUserInfo(commandMap.getMap(), session);
		m.addObject("userInfo",userInfo);
		return m;
	}
	
	@RequestMapping(value="/user/mypage/info/userCheck")
	public ModelAndView checkUser(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView m = new ModelAndView("user/mypage/info/userCheck"); //비밀번호 입력창으로 이동
		
		Map<String,Object> userInfo = userInfoService.selectUserInfo(commandMap.getMap(), session);
		m.addObject("userInfo",userInfo);
		return m;
	}
	
	//비밀번호 동일한 것을 확인한 후 회원정보 수정 및 회원탈퇴 기능을 보여주는 페이지로 이동
	@RequestMapping(value="/user/mypage/info/userOption")
	public ModelAndView userOption(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView m = new ModelAndView("user/mypage/info/userOption"); //비밀번호 입력창으로 이동

		Map<String,Object> userInfo = userInfoService.selectUserInfo(commandMap.getMap(), session);
		List<Map<String,Object>> reservList = userInfoService.checkReserv(commandMap.getMap(), session); //사장님 예약내역 check
		m.addObject("userInfo",userInfo);
		m.addObject("reservList",reservList);
		return m;
	}
	
	
	
	@RequestMapping(value="/user/mypage/info/deleteUser")
	public ModelAndView deleteUser(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView m = new ModelAndView("redirect:/main");
		
		userInfoService.deleteUser(commandMap.getMap()); //회원삭제
		session.invalidate(); //세션종료
		m.addObject("out","회원이 탈퇴되었습니다.");
		return m;
	}
	
	@RequestMapping(value="/user/mypage/info/openUserUpdate")
	public ModelAndView openUserUpdate(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView m = new ModelAndView("user/mypage/info/userUpdate"); //회원정보 수정 창으로 이동
		Map<String,Object> userInfo = userInfoService.selectUserInfo(commandMap.getMap(), session);
		m.addObject("userInfo",userInfo);
		return m;
	}
	
	@RequestMapping(value="/user/mypage/info/updateUserInfo")
	public ModelAndView updateUserInfo(CommandMap commandMap) throws Exception {
		ModelAndView m = new ModelAndView("redirect:/user/mypage/info/userInfo"); //마이페이지로 이동
		userInfoService.updateUserInfo(commandMap.getMap());
		return m;
	}
	
	
	
	

}
