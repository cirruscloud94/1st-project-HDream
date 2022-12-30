package com.honeydream.user.mypage.reserv.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.common.domain.CommandMap;
import com.honeydream.user.mypage.reserv.service.ReservService;

@Controller
public class UserReservController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="userReservService")
	private ReservService reservService;
	
	@RequestMapping(value="/user/mypage/reserv/reservList")
	public ModelAndView selectReservList(CommandMap commandMap , HttpSession session) throws Exception {
		
		ModelAndView m = new ModelAndView("user/mypage/reserv/reservList"); //jsp의 이름
		Map<String,Object> map = reservService.selectReservList(commandMap.getMap(),session);
		m.addObject("list", map.get("result"));
		System.out.println(map.get("result"));
		m.addObject("paginationInfo", (PaginationInfo)map.get("paginationInfo"));
		return m;
	}
	
	@PostMapping(value="/user/mypage/reserv/cancelReserv")
	public ModelAndView cancelReserv(CommandMap commandMap) throws Exception {

		ModelAndView m = new ModelAndView("redirect:/user/mypage/reserv/reservList"); //리다이렉트
		commandMap.put("R_IDX", Integer.parseInt((String)commandMap.get("R_IDX"))); //String타입으로 넘어온 R_IDX를 정수로 타입변환
		reservService.cancelReserv(commandMap.getMap()); //예약취소
		return m;
	}
	
	
	
	@GetMapping(value="/user/reserv/refundForm")
	public ModelAndView refundForm(CommandMap commandMap) throws Exception {
		ModelAndView m = new ModelAndView("/user/mypage/reserv/refund"); //리다이렉트
		return m;
	}
	
	@PostMapping(value="/user/reserv/submitRefundForm")
	public ModelAndView submitRefundForm(CommandMap commandMap) throws Exception {
		reservService.updateRefund(commandMap.getMap()); //예약취소
		ModelAndView m = new ModelAndView("/user/mypage/reserv/refundComplete"); //리다이렉트
		return m;
	}
}