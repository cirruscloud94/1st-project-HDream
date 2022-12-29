package com.honeydream.user.mypage.zzim.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface ZzimService {
	
	public Map<String,Object> selectZzim(Map<String, Object> map, HttpSession session) throws Exception;

	void deleteZzim(Map<String, Object> map, HttpSession session)throws Exception;
}
