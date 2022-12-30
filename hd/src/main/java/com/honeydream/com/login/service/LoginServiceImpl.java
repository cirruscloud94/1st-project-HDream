package com.honeydream.com.login.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.com.login.dao.LoginDAO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;
	
	@Override
	public Map<String, Object> login(Map<String, Object> map) throws Exception {
		return loginDAO.getUserInfo(map);
	}
	@Override
	public Map<String, Object> findId(Map<String, Object> map) throws Exception {
		return loginDAO.getUserInfo(map);
	}
	@Override
	public int findPw(Map<String, Object> map) throws Exception {
		return loginDAO.updatePw(map);
	}
}