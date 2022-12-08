package com.honeydream.com.join.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.com.join.service.JoinService;
import com.honeydream.common.domain.CommandMap;

@Controller
public class JoinController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="joinService")
	private JoinService joinService;//지정된 이름의 객체 주입
	
	@RequestMapping(value="/join", method=RequestMethod.GET)//회원가입 폼 출력
	public String join(CommandMap commandMap) throws Exception{
		return "/join/join_form";
	}
	@RequestMapping(value="/join", method=RequestMethod.POST)//회원가입 폼 제출 시
	public ModelAndView join_confirm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(commandMap.get("sns")!=null) { mv.setViewName("jsonView"); }else { mv.setViewName("/join/join_form"); }
		String result = null;
		int insertCnt = joinService.insertMember(commandMap.getMap());
		if(insertCnt > 0) { result = "success"; }else { result = "joinError"; }
		mv.addObject("result",result);
		return mv;
	}
	
	@RequestMapping("/joinOwner")//사업자 회원가입 클릭 시
	public ModelAndView joinOwner(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/join/join_form");
		Object type = commandMap.get("m_type");
		if(type != null) mv.addObject("m_type",type.toString());
		return mv;
	}
	@RequestMapping(value="/join/confirmId", method=RequestMethod.POST)//아이디 중복확인
	public ModelAndView confirmId(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");//데이터를 넘겨줄거기 때문에 jsonView
		Map<String, Object> map = joinService.getUserInfo(commandMap.getMap());
		if(map == null || map.isEmpty())
			mv.addObject("result", "success");//아이디가 존재하지 않음. 즉, 가입 가능
		else
			mv.addObject("result", "fail");//아이디가 존재함
		return mv;
	}
}