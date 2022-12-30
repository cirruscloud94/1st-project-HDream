package com.honeydream.admin.review.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.admin.review.dao.AReviewDAO;

@Service("areviewService")
public class AReviewServiceImpl implements AReviewService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="areviewDAO")
	private AReviewDAO areviewDAO;
	
	//리뷰 페이징 리스트
	@Override 
	public Map<String, Object>reviewList(Map<String, Object> map)throws Exception { 
		return areviewDAO.reviewList(map); 
	}
	
	//리뷰 상세
	@Override
	public Map<String, Object>reviewDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = areviewDAO.reviewDetail(map);
		return resultMap;
	}
	
	//리뷰 삭제
	@Override
	public void deleteReview(Map<String, Object> map) throws Exception {
		areviewDAO.deleteReview(map);
	}
}
