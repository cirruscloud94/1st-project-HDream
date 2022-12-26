package com.honeydream.com.main.dao;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("mainDAO")
public class MainDAO  extends AbstractDAO {
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> mainList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.main", map);
	}
}
