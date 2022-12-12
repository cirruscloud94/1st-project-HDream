package com.honeydream.com.detail.service;

import java.util.List;
import java.util.Map;


public interface GoodsDetailService {
	
	//비지니스 로직의 수행을 위한 메서드 정의
	Map<String, Object> selectGoodsInfo(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectPrice(Map<String, Object> map)throws Exception;
	
	Map<String, Object> selectContents(Map<String, Object> map)throws Exception;
	
	List<Map<String, Object>> selectReview(Map<String, Object> map)throws Exception;
}
