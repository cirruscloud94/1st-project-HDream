package com.honeydream.com.login.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getUserInfo(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("common.getUserInfo", map);
	}
	
	public int updatePw(Map<String, Object> map) throws Exception {
		return Integer.parseInt(update("common.resetPw", map).toString());
	}
}