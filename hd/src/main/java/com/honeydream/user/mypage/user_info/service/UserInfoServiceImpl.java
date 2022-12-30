package com.honeydream.user.mypage.user_info.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.user.mypage.user_info.dao.UserInfoDAO;

@Service("userInfoService")
public class UserInfoServiceImpl implements UserInfoService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "userInfoDAO")
	private UserInfoDAO userInfoDAO;

	@Override
	public Map<String, Object> selectUserInfo(Map<String, Object> map, HttpSession session) throws Exception {
		
		String m_id = (String)session.getAttribute("m_id"); //로그인 아이디가져오기
		map.put("m_id", m_id);
		return userInfoDAO.selectUserInfo(map);
	}

	@Override
	public void deleteUser(Map<String, Object> map) throws Exception {
		userInfoDAO.deleteUser(map);
	}

	@Override
	public void updateUserInfo(Map<String, Object> map) throws Exception {
		userInfoDAO.updateUserInfo(map);
	}

	@Override
	public List<Map<String, Object>> checkReserv(Map<String, Object> map, HttpSession session) throws Exception {
		String m_id = (String)session.getAttribute("m_id"); //로그인 아이디가져오기
		map.put("m_id", m_id);
		return userInfoDAO.checkReserv(map);
	}

}
