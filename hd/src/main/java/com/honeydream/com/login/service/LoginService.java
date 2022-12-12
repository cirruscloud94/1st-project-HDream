package com.honeydream.com.login.service;

import java.util.Map;

public interface LoginService {
	Map<String, Object> login(Map<String, Object> map) throws Exception;
	Map<String, Object> findId(Map<String, Object> map) throws Exception;
	int findPw(Map<String, Object> map) throws Exception;
}