package com.honeydream.com.reserv.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.com.reserv.service.ReservService;
import com.honeydream.common.domain.CommandMap;

@Controller
public class ReservController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reservService")
	private ReservService reservService;
	
	@RequestMapping(value = "/reserv") //예약 페이지 옵션
	public ModelAndView reserv(CommandMap commandMap)throws Exception {
		
		ModelAndView mv = new ModelAndView("reserv/reservation");
		
		commandMap.put("goodsReg_Idx", commandMap.get("GOODSREG_IDX"));
		
		Map<String, Object> map = 
				reservService.reserv(commandMap.getMap());
		
		mv.addObject("GOODSREG_IDX", commandMap.get("GOODSREG_IDX"));
		mv.addObject("option", map);
		
		return mv;
	}
	
	@RequestMapping(value = "/reserv/getTime") //예약 시간확인
	public ModelAndView selectReservTime(CommandMap commandMap)throws Exception {
		
		ModelAndView mv = new ModelAndView("jsonView");
		
		Map<String, Object> map = 
				reservService.selectReservTime(commandMap.getMap());
		
		mv.addObject("time", map);
		
		return mv;
	}
}
