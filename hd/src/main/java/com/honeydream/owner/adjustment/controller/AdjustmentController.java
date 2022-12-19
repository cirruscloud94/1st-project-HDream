package com.honeydream.owner.adjustment.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.common.domain.CommandMap;
import com.honeydream.owner.adjustment.service.AdjustmentService;

@Controller
public class AdjustmentController {
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "adjustmentService")
	private AdjustmentService adjustmentService;
	
	
	//정산정보 확인하기
	@RequestMapping(value = "/owner/mypage/adjustment")
	public ModelAndView selectReservList(CommandMap commandMap, HttpSession session) throws Exception {
		
		ModelAndView m = new ModelAndView("user/mypage/cafe_adjustment/adjustment"); // jsp의 이름
		Map<String, Object> profit = adjustmentService.selectCafeProfit(commandMap.getMap(), session);
		Map<String, Object> refund = adjustmentService.selectCafeRefund(commandMap.getMap(), session);
		List<Map<String,Object>> detail = adjustmentService.selectCProfitDetail(commandMap.getMap(), session);
		m.addObject("profit", profit);
		m.addObject("refund", refund);
		m.addObject("detail",detail);
		return m;
	}
	
	
	
}
