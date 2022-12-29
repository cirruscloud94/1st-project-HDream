package com.honeydream.user.mypage.review.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("reviewDAO")
public class ReviewDAO extends AbstractDAO {
	
//	@SuppressWarnings("unchecked")
//	public List<Map<String, Object>> selectReview(Map<String, Object> map)throws Exception {
//		return (List<Map<String, Object>>) selectList("review.selectReview", map);
//	}
	@SuppressWarnings("unchecked") 
	public Map<String,Object>selectReview(Map<String, Object> map) throws Exception {
	  return(Map<String, Object>)selectPagingList("review.selectReview", map); 
	}
//	리뷰 작성
	public void insertReview(Map<String, Object> map) throws Exception {
		insert("review.insertReview", map);
	}
//	리뷰 수정
	public void updateReview(Map<String, Object> map) throws Exception {
		update("review.updateReview", map);
	}
	
//	리뷰 삭제
	public void deleteReview(Map<String, Object> map) throws Exception {
		update("review.deleteReview", map);
	}

}
