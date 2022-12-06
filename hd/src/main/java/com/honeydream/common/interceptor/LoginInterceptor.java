package com.honeydream.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//url이 /login~, /join~ 로 시작하는 경로에 대한 인터셉터
public class LoginInterceptor extends HandlerInterceptorAdapter{
	protected Log log = LogFactory.getLog(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		HttpSession session = request.getSession();
		Object m_type_obj = session.getAttribute("m_type");
		
		if(m_type_obj != null) {//세션에 타입이 있다면 == 로그인을 했다면
			log.debug("로그인인터셉터         : 로그인 중 "+request.getRequestURI()+" 접근 불가");
			//리다이렉트
			response.sendRedirect(request.getContextPath() + "/main");
			return false;
		}else { log.debug("로그인인터셉터         : 통과"); }
		return super.preHandle(request, response, handler);
	}
}