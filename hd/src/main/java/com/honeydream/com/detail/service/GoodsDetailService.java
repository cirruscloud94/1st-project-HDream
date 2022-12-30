package com.honeydream.com.detail.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


public interface GoodsDetailService {
	//비지니스 로직의 수행을 위한 메서드 정의
	Map<String, Object> selectGoodsInfo(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectMainImage(Map<String, Object> map)throws Exception;
	
	List<Map<String, Object>> selectPrice(Map<String, Object> map)throws Exception;
	
	Map<String, Object> selectContents(Map<String, Object> map)throws Exception;
	
	List<Map<String, Object>> selectReview(Map<String, Object> map)throws Exception;
	
	Map<String, Object> checkZzim(Map<String, Object> map, HttpSession session)throws Exception;

    void insertZzim(Map<String, Object> map, HttpSession session)throws Exception;

    void deleteZzim(Map<String, Object> map, HttpSession session)throws Exception;
    
    // 리뷰 개수
    Map<String, Object> selectReviewCount(Map<String, Object> map)throws Exception;
    
    //상세보기 리뷰 페이징 리스트
  	Map<String, Object>reviewList(Map<String, Object> map) throws Exception;   
}