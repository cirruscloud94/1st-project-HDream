package com.honeydream.user.reserv.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.common.domain.CommandMap;
import com.honeydream.user.reserv.service.ReservService;

@Controller
public class ReservController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="ReservService")
	private ReservService reservService;
	
	@RequestMapping(value = "/reserv") //예약 페이지 옵션
	public ModelAndView reserv(CommandMap commandMap)throws Exception {
		
		ModelAndView mv = new ModelAndView("user/reserv/reservation");
		
		mv.addObject("goodsReg_Idx", commandMap.get("goodsReg_Idx"));
		mv.addObject("goodsReg_optionName", commandMap.get("goodsReg_optionName"));
		
		return mv;
	}
	
	@RequestMapping(value = "/reserv/getTime") //예약 시간확인 페이지 출력
	public ModelAndView selectReservTime(CommandMap commandMap)throws Exception {
		
		ModelAndView mv = new ModelAndView("jsonView");
		
		Map<String, Object> map = 
				reservService.selectReservTime(commandMap.getMap());
		
		mv.addObject("time", map);
		
		return mv;
	}
	
	
}
