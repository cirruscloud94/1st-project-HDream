package com.honeydream.com.main.service;

import java.util.List;
import java.util.Map;

public interface MainService {
	
	
	List<Map<String, Object>> mainList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> mainSearch(Map<String, Object> map) throws Exception;
	
//	List<Map<String, Object>> searchMap(Map<String, Object> map) throws Exception;
	

}
