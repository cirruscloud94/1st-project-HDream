package com.honeydream.admin.user_info.service;

import java.util.Map;

public interface UserService {
	//회원 목록
	Map<String, Object>userList(Map<String, Object> map) throws Exception;
	
	//회원 상세
	Map<String, Object>userDetail(Map<String, Object> map) throws Exception;
	
	//회원 수정
	int modifyUser(Map<String, Object> map) throws Exception;
}
