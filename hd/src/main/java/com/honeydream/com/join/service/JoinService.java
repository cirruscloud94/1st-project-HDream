package com.honeydream.com.join.service;

import java.util.Map;

public interface JoinService {
	void insertMember(Map<String, Object> map) throws Exception;
	Map<String, Object> getUserInfo(String m_id) throws Exception;
}