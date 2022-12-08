package com.honeydream.com.join.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("joinDAO")
public class JoinDAO extends AbstractDAO{
	public int insertMember(Map<String, Object> map) throws Exception{
		return Integer.parseInt(insert("common.join", map).toString());
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> getUserInfo(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("common.getUserInfo", map);
	}
}