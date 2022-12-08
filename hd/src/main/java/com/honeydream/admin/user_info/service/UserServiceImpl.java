package com.honeydream.admin.user_info.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.admin.user_info.dao.UserDAO;

@Service("userService")
public class UserServiceImpl implements UserService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="userDAO")
	private UserDAO userDAO;
	
	//회원 목록
	@Override
	public List<Map<String, Object>>userList() throws Exception {
		return userDAO.userList();
	}
	
	//회원 상세
	@Override
	public Map<String, Object>userDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = userDAO.userDetail(map);
		
		return resultMap;
	}
	
	//회원 수정
	@Override
	public void modifyUser(Map<String, Object> map) throws Exception {
		userDAO.modifyUser(map);
	}
	
	
	//회원 삭제
	@Override
	public void deleteUser(Map<String, Object> map) throws Exception {
		userDAO.deleteUser(map);
	}
	
	//회원 검색
	@Override
	public List<Map<String, Object>>selectUserSearch(Map<String, Object> map) throws Exception {
		return userDAO.selectUserSearch(map);
	}
}