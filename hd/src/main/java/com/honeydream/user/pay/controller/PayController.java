package com.honeydream.user.pay.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.common.domain.CommandMap;
import com.honeydream.user.pay.service.PayService;

@Controller
public class PayController {
	
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="PayService")
	private PayService payService;
	
	@RequestMapping(value = "/reserv/pay")
	public ModelAndView payReserv(CommandMap commandMap)throws Exception {
		
		ModelAndView mv = new ModelAndView("user/pay/userPay");
		
		return mv;
	}

}
