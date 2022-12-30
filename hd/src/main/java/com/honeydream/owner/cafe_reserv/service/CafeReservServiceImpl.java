package com.honeydream.owner.cafe_reserv.service;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.owner.cafe_reserv.dao.CafeReservDAO;

@Service("cafeReservService")
public class CafeReservServiceImpl implements CafeReservService{
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "cafeReservDAO")
	private CafeReservDAO cafeReservDAO;

	@Override
	public Map<String, Object> selectCafeReservList(Map<String, Object> map, HttpSession session)
			throws Exception {
		String m_id = (String)session.getAttribute("m_id"); //세션에서 로그인 아이디가져오기
		map.put("m_id", m_id);
		return cafeReservDAO.selectCafeReservist(map);
	}

	@Override
	public void updateStatus(Map<String, Object> map) throws Exception {
		cafeReservDAO.updateStatus(map);
	}

	@Override
	public Map<String, Object> checkStatus(Map<String, Object> map) throws Exception {
		return cafeReservDAO.checkStatus(map);
	}
}