package com.honeydream.com.join.service;

import java.util.Map;

public interface JoinService {
	int insertMember(Map<String, Object> map) throws Exception;
	Map<String, Object> getUserInfo(Map<String, Object> map) throws Exception;
}