package com.honeydream.user.pay.service;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.user.pay.dao.PayDAO;

@Service("payService")
public class PayServiceImpl implements PayService{
	
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="payDAO")
	private PayDAO payDAO;
	
	@Override
	public Map<String, Object> payReserv(Map<String, Object> map)
	throws Exception {
		return payDAO.payReserv(map);
	}

	
	@Override
	public Map<String, Object> selectUserInfo(Map<String, Object> map, HttpSession session) throws Exception {
		String m_id = (String)session.getAttribute("m_id"); //로그인 아이디가져오기
		map.put("m_id", m_id);
		return payDAO.selectUserInfo(map);
	}


	@Override
	public Map<String, Object> selectCafeInfo(Map<String, Object> map) throws Exception {
		return payDAO.selectCafeInfo(map);
	}


	@Override
	public Map<String, Object> selectGoodsInfo(Map<String, Object> map) throws Exception {
		return payDAO.selectGoodsInfo(map);
	}
	
	@Override
	public void insertReserv(Map<String, Object> map) throws Exception {
		payDAO.insertReserv(map);
	}
}
