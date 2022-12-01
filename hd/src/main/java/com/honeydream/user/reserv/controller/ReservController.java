package com.honeydream.user.reserv.controller;

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
	
	@RequestMapping(value = "/reserv/time")
	public ModelAndView selectReservTime(CommandMap commandMap)throws Exception {
		
		ModelAndView mv = new ModelAndView("user/reserv/reservTime");
		
		return mv;
	}
}
