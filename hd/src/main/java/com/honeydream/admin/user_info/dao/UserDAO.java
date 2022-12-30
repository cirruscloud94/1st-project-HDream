package com.honeydream.admin.user_info.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("userDAO")
public class UserDAO extends AbstractDAO {
	
	//회원 목록
	@SuppressWarnings("unchecked")
	public Map<String, Object>userList(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectPagingList("admin.userList", map);
	}
	
	//회원 상세
	@SuppressWarnings("unchecked")
	public Map<String, Object>userDetail(Map<String, Object> map) throws Exception {
		return(Map<String, Object>)selectOne("admin.selectUserDetail", map);
	}
	
	//회원 수정
	public int modifyUser(Map<String, Object> map) throws Exception {
		return Integer.parseInt(update("admin.modifyUser", map).toString());
	}
}