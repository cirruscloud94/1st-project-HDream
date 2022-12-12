package com.honeydream.user.mypage.reserv.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.common.domain.CommandMap;
import com.honeydream.user.mypage.reserv.service.ReservService;

@Controller
public class UserReservController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="userReservService")
	private ReservService reservService;
	
	@GetMapping(value="/user/mypage/reserv/reservList")
	public ModelAndView selectReservList(CommandMap commandMap , HttpSession session) throws Exception {
		
		ModelAndView m = new ModelAndView("user/mypage/reserv/reservList"); //jsp의 이름
		List<Map<String,Object>> list = reservService.selectReservList(commandMap.getMap(),session);
		m.addObject("list",list);
		return m;
	}
	
	@PostMapping(value="/user/mypage/reserv/cancelReserv")
	public ModelAndView cancelReserv(CommandMap commandMap) throws Exception {

		ModelAndView m = new ModelAndView("redirect:/user/mypage/reserv/reservList"); //리다이렉트
		commandMap.put("R_IDX", Integer.parseInt((String)commandMap.get("R_IDX"))); //String타입으로 넘어온 R_IDX를 정수로 타입변환
		reservService.cancelReserv(commandMap.getMap()); //예약취소
		return m;
	}
	
	
	
	

	
}