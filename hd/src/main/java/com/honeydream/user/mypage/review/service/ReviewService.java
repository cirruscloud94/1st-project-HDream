package com.honeydream.user.mypage.review.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface ReviewService {

//	List<Map<String, Object>> selectReview(Map<String, Object> map, HttpSession session) throws Exception;
	//리뷰 페이징 리스트
	Map<String, Object>selectReview(Map<String, Object> map, HttpSession session) throws Exception; 
	
	void insertReview(Map<String, Object> map, HttpSession session) throws Exception;
	
	void updateReview(Map<String, Object> map, HttpSession session) throws	Exception;
		
	void deleteReview(Map<String, Object> map, HttpSession session) throws Exception;
}
