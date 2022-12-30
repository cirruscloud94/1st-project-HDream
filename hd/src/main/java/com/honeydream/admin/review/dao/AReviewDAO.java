package com.honeydream.admin.review.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("areviewDAO")
public class AReviewDAO extends AbstractDAO{
	//리뷰 페이징 리스트
	@SuppressWarnings("unchecked") public Map<String,Object>reviewList(Map<String, Object> map) throws Exception {
	  return(Map<String, Object>)selectPagingList("rvadmin.reviewList", map); 
	}
	
	//리뷰 상세
	@SuppressWarnings("unchecked")
	public Map<String, Object>reviewDetail(Map<String, Object> map) throws Exception {
		return(Map<String, Object>)selectOne("rvadmin.selectReviewDetail", map);
	}
	
	//리뷰 삭제
	public void deleteReview(Map<String, Object> map) throws Exception {
		delete("rvadmin.deleteReview", map);
	}
}
