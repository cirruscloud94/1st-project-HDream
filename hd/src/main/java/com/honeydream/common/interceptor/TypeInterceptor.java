package com.honeydream.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//회원 유형별 접근 가능한 url을 설정한 인터셉터
public class TypeInterceptor extends HandlerInterceptorAdapter{
	protected Log log = LogFactory.getLog(TypeInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		HttpSession session = request.getSession();
		//m_type이 일반:0, 사업주:1, 관리자: 2
		String m_type = (session.getAttribute("m_type")==null)?null:session.getAttribute("m_type").toString();
		//접근 경로
		String req_url = request.getRequestURI();
		log.debug(req_url);
		if(m_type != null) {//세션에 타입이 있다면 == 로그인을 했다면
			switch (m_type) {
			case "2": //m_type이 관리자:2 일 때 /admin/~로 시작하는 경로만 접근 가능
				if(!(
						req_url.contains("/admin")
						|| req_url.contains("/logout")
						|| req_url.contains("/resources")
						|| req_url.contains("/include")
						)) {
					log.debug("타입인터셉터         : admin페이지만 접근 가능합니다!");
					//리다이렉트
					response.sendRedirect(request.getContextPath() + "/admin/userList");
					return false;
				}
				break;
			case "0": //m_type이 일반:0 일 때 /admin/~, /owner/~ 로 시작하는 모든 경로는 접근 불가
				if(req_url.contains("/admin") || req_url.contains("/owner")) {
					log.debug("타입인터셉터         : admin 페이지와 사업주 페이지는 접근이 불가한 회원 유형입니다!");
					//리다이렉트
					response.sendRedirect(request.getContextPath() + "/main");
					return false;
				}
				break;
			case "1": //m_type이 사업주:1 일 때 /admin/~로 시작하는 모든 경로는 접근 불가
				if(req_url.contains("/admin")) {
					log.debug("타입인터셉터         : admin 페이지는 접근이 불가한 회원 유형입니다!");
					//리다이렉트
					response.sendRedirect(request.getContextPath() + "/main");
					return false;
				}
				break;
			}
		}else if(req_url.contains("/admin") || req_url.contains("/user") || req_url.contains("/owner")){//로그인을 안했다면
			//url이 /admin~, /user~, /owner~ 로 시작하는 모든 경로는 접근 불가
			log.debug("타입인터셉터         : 미 로그인시 "+request.getRequestURI()+" 접근 불가");
			//리다이렉트
			response.sendRedirect(request.getContextPath() + "/main");
			return false;
		}
		return super.preHandle(request, response, handler);
	}
}