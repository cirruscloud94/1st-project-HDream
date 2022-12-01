package com.honeydream.com.main.service;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.com.main.dao.MainDAO;

@Service("mainService")
public class MainServiceImpl implements MainService{
	
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mainDAO")
	private MainDAO mainDAO;
	
	@Override
	public List<Map<String, Object>> mainList(Map<String, Object> map) throws Exception {
		return mainDAO.mainList(map);
	}
	
	@Override
	public List<Map<String, Object>> mainSearch(Map<String, Object> map) throws Exception {
		return mainDAO.mainSearch(map);
	}
	
//	@Override
//	public List<Map<String, Object>> searchMap(Map<String, Object> map) throws Exception {
//		return mainDAO.searchMap(map);
//	}
	
}
