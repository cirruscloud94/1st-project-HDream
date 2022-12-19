package com.honeydream.user.pay.controller;

import java.io.IOException;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.common.domain.CommandMap;
import com.honeydream.user.pay.service.PayService;

@Controller
public class PayController {
	
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="payService")
	private PayService payService;
	
//	private IamportClient api;
//	
//	public PayController() {
//		// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
//		this.api = new IamportClient("8468807447825621","SfywYen5DG7cEcPk96AF9M8XRP4rTzYb3XOGBOnpJbFpInXPuGtdWzxPkEFhEf6ktwr3fddFfD4AUO5U");
//	}
	
	@RequestMapping(value = "/user/reserv/pay")
	public ModelAndView payReserv(CommandMap commandMap, HttpSession session)throws Exception {
		ModelAndView mv = new ModelAndView("/user/pay/userPay");
		System.out.println(commandMap.get("cafe_idx"));
		Map<String,Object> userInfo = payService.selectUserInfo(commandMap.getMap(), session); //회원정보 
		Map<String,Object> cafeInfo = payService.selectCafeInfo(commandMap.getMap()); //사장님 계좌정보
		Map<String,Object> goodsInfo = payService.selectGoodsInfo(commandMap.getMap()); //상품
		
		mv.addObject("userInfo",userInfo);
		mv.addObject("cafeInfo",cafeInfo);
		mv.addObject("goodsInfo",goodsInfo);
		
		mv.addObject("selectedDate",commandMap.get("selectedDate"));
		mv.addObject("selectTime",commandMap.get("selectTime"));
		mv.addObject("peopleNum",commandMap.get("peopleNum"));
		 
		return mv;
	}
	
	@RequestMapping("/user/reserv/completePay")
	public ModelAndView insertReserv(CommandMap commandMap) throws Exception {
		ModelAndView m = new ModelAndView("user/pay/completePay"); //결제성공시 뜰 페이지
		payService.insertReserv(commandMap.getMap()); //DB에 삽입문 넣기
		
		return m;
	}
	
//	@ResponseBody
//	@RequestMapping(value="/user/reserv/pay/{imp_uid}")
//	public IamportResponse<Payment> paymentByImpUid(
//			Model model
//			, Locale locale
//			, HttpSession session
//			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
//	{	
//			return api.paymentByImpUid(imp_uid);
//	}
}
