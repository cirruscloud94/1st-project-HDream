package com.honeydream.admin.review.service;

import java.util.Map;

public interface AReviewService {
	//리뷰 페이징 리스트
	Map<String, Object>reviewList(Map<String, Object> map) throws Exception; 
		
	//리뷰 상세
	Map<String, Object>reviewDetail(Map<String, Object> map) throws Exception;
		
	//리뷰 삭제
	void deleteReview(Map<String, Object> map) throws Exception;
}
