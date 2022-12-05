package com.honeydream.com.join.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("joinDAO")
public class JoinDAO extends AbstractDAO{
	public void insertMember(Map<String, Object> map) throws Exception{
		insert("common.join", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> getUserInfo(String m_id) throws Exception{
		return (Map<String, Object>)selectOne("common.getUserInfo", m_id);
	}
}