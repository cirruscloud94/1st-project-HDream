package com.honeydream.com.login.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.honeydream.com.login.service.LoginService;
import com.honeydream.common.domain.CommandMap;

@Controller
public class LoginController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	//로그인 폼
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		return "/login/login_form";
	}
	
	//일반 로그인 처리
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		if(commandMap.get("sns")!=null) { mv.setViewName("jsonView"); } else { mv.setViewName("/login/login_form"); }
		
		Map<String, Object> map = loginService.login(commandMap.getMap());
		//아이디 검증
		if(map == null || map.isEmpty() || map.get("M_ID") == null) {//값이 없을 경우
			mv.addObject("result","loginError");
			mv.addObject("resultMsg","존재하지 않는 아이디입니다!");
			return mv;
		}
		//비번 검증
		String pw = commandMap.get("m_pw").toString();
		String c_pw = map.get("M_PW").toString();//비번이 맞는지 틀린지
		if(!c_pw.equals(pw)) {//비번이 같지 않다면
			mv.addObject("result","loginError");
			mv.addObject("resultMsg","비밀번호가 일치하지 않습니다!");
			return mv;
		}
		int min = 30;
		mv.addObject("result","success");
		mv.addObject("resultMsg","로그인에 성공하셨습니다! 로그인 유지 시간은 "+min+"분 입니다.");
		session.setMaxInactiveInterval(60*min);//세션 유효시간 30분으로 지정
		session.setAttribute("m_id", map.get("M_ID"));
		session.setAttribute("m_pw", map.get("M_PW"));
		session.setAttribute("m_name", map.get("M_NAME"));
		session.setAttribute("m_type", map.get("M_TYPE"));
		
		return mv;
	}
	
	//로그아웃 처리
	@RequestMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		session.invalidate();//세션 전체를 날림
		rttr.addAttribute("logout", "y");
		return "redirect:/login"; //로그아웃 후 메인 페이지로 이동
	}
}