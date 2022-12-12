package com.honeydream.user.reserv.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.com.login.service.LoginService;
import com.honeydream.common.domain.CommandMap;
import com.honeydream.user.reserv.service.ReservService;

@Controller
public class ReservController {
	
	Logger log = Logger.getLogger(this.getClass());
	
//	ReservService 서비스 호출
	@Resource(name="reservService")
	private ReservService reservService;
	
//	LoginService 서비스 호출
	@Resource(name="loginService")
	private LoginService loginService;
	
	@RequestMapping(value = "/user/reserv") //예약 페이지  CommandMap, HttpSession 
	public ModelAndView reserv(CommandMap commandMap, HttpSession session)throws Exception {
		
		ModelAndView mv = new ModelAndView("/user/reserv/reservation"); // jsp경로 객체생성
		// put = 키값, 밸류값 get = 맵으로부터 키값 리턴
		commandMap.put("goodsReg_Idx", commandMap.get("GOODSREG_IDX")); //키값, 밸류값
		
		commandMap.put("m_id", session.getAttribute("m_id"));
		
		Map<String, Object> map = 
				reservService.reserv(commandMap.getMap());
		
		mv.addObject("GOODSREG_IDX", commandMap.get("GOODSREG_IDX"));
		mv.addObject("option", map);
		mv.addObject("userInfo", loginService.findId(commandMap.getMap()));
		
		return mv;
	}
	
	@RequestMapping(value = "/user/reserv/getTime") //예약 시간확인
	public ModelAndView selectReservTime(CommandMap commandMap)throws Exception {
		
		ModelAndView mv = new ModelAndView("jsonView");
		
		Map<String, Object> map = 
				reservService.selectReservTime(commandMap.getMap());
		
		mv.addObject("time", map);
		
		return mv;
	}
}
