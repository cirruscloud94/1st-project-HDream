package com.honeydream.owner.adjustment.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.owner.adjustment.dao.AdjustmentDAO;

@Service("adjustmentService")
public class AdjustmentServiceImpl implements AdjustmentService{
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "adjustmentDAO")
	private AdjustmentDAO adjustmentDAO;
	
	@Override
	public Map<String, Object> selectCafeProfit(Map<String, Object> map, HttpSession session) throws Exception {
		String m_id = (String)session.getAttribute("m_id"); //세션에서 로그인 아이디가져오기
		map.put("m_id", m_id);
		return adjustmentDAO.selectCafeProfit(map);
	}

	@Override
	public Map<String, Object> selectCafeRefund(Map<String, Object> map, HttpSession session) throws Exception {
		String m_id = (String)session.getAttribute("m_id"); //세션에서 로그인 아이디가져오기
		map.put("m_id", m_id);
		return adjustmentDAO.selectCafeRefund(map);
	}

	@Override
	public List<Map<String,Object>> selectCProfitDetail(Map<String, Object> map, HttpSession session) throws Exception {
		String m_id = (String)session.getAttribute("m_id"); //세션에서 로그인 아이디가져오기
		map.put("m_id", m_id);
		return adjustmentDAO.selectCProfitDetail(map);
	}

}
