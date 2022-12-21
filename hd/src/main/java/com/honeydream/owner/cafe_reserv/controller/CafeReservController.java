package com.honeydream.owner.cafe_reserv.controller;

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
import com.honeydream.owner.cafe_reserv.service.CafeReservService;

@Controller
public class CafeReservController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "cafeReservService")
	private CafeReservService cafeReservService;

	@GetMapping(value = "/owner/mypage/cafe_reserv/cafeReservList")
	public ModelAndView selectReservList(CommandMap commandMap, HttpSession session) throws Exception {

		//session.setAttribute("m_id", "boss11"); 배포시 지워주기

		ModelAndView m = new ModelAndView("user/mypage/cafe_reserv/cafeReservList"); // jsp의 이름
		List<Map<String, Object>> list = cafeReservService.selectCafeReservList(commandMap.getMap(), session);
		m.addObject("list", list);
		return m;
	}

	@PostMapping(value = "/owner/mypage/cafe_reserv/updateStatus")
	public ModelAndView updateStatus(CommandMap commandMap) throws Exception {
		
		ModelAndView m = new ModelAndView("redirect:/owner/mypage/cafe_reserv/cafeReservList"); //리다이렉트
		
		String r_status = (String)cafeReservService.checkStatus(commandMap.getMap()).get("r_status");
		if(r_status != "0") {
			cafeReservService.updateStatus(commandMap.getMap());
		}
		return m;
	}

}
