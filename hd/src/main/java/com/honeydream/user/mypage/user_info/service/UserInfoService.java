package com.honeydream.user.mypage.user_info.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

public interface UserInfoService {
	
	public Map<String,Object> selectUserInfo(Map<String, Object> map, HttpSession session) throws Exception;

	void deleteUser(Map<String, Object> map) throws Exception;
	
	void updateUserInfo(Map<String, Object> map) throws Exception;

}