package com.honeydream.admin.user_info.service;

import java.util.List;
import java.util.Map;

public interface UserService {
	
	//회원 목록
	List<Map<String, Object>>userList() throws Exception;
	
	//회원 상세
	Map<String, Object>userDetail(Map<String, Object> map) throws Exception;
	
	//회원 수정
	void modifyUser(Map<String, Object> map) throws Exception;
	
	//회원 삭제
	void deleteUser(Map<String, Object> mapt) throws Exception;
	
	//회원 검색
	List<Map<String, Object>>selectUserSearch(Map<String, Object> map) throws Exception;
}
