package com.honeydream.admin.user_info.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("userDAO")
public class UserDAO extends AbstractDAO {
	
	//회원 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>>userList() throws Exception {
		return (List<Map<String, Object>>)selectList("admin.userList");
	}
	
	//회원 상세
	@SuppressWarnings("unchecked")
	public Map<String, Object>userDetail(Map<String, Object> map) throws Exception {
		return(Map<String, Object>)selectOne("admin.selectUserDetail", map);
	}
	
	//회원 수정
	public void modifyUser(Map<String, Object> map) throws Exception {
		update("admin.modifyUser", map);
	}
	
	//회원 삭제
	public void deleteUser(Map<String, Object> map) throws Exception {
		delete("admin.deleteUser", map);
	}
	
	//회원 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>>selectUserSearch(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("admin.selectUserSearch", map);
	}
}