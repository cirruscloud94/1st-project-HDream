package com.honeydream.com.main.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("mainDAO")
public class MainDAO  extends AbstractDAO {
	@SuppressWarnings("unchecked")
	public Map<String, Object> mainList(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectPagingList("common.main", map);
	}
}
