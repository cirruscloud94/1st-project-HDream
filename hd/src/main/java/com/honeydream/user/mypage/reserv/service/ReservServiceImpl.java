package com.honeydream.user.mypage.reserv.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.user.mypage.reserv.dao.ReservDAO;

@Service("userReservService")
public class ReservServiceImpl implements ReservService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "userReservDAO")
	private ReservDAO reservDAO;

	@Override
	public Map<String,Object> selectReservList(Map<String, Object> map, HttpSession session) throws Exception {
		String m_id = (String)session.getAttribute("m_id"); //세션에서 로그인 아이디가져오기
		map.put("m_id", m_id);
		
		return reservDAO.selectReservist(map);
	}

	@Override
	public void cancelReserv(Map<String, Object> map) throws Exception {
		reservDAO.cancelReserv(map);
	}

	@Override
	public void updateRefund(Map<String, Object> map) throws Exception {
		reservDAO.updateRefund(map);
	}
	
	

}
