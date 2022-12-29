package com.honeydream.user.mypage.review.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.user.mypage.review.dao.ReviewDAO;



@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "reviewDAO")
	private ReviewDAO reviewDAO;

//	@Override
//	public List<Map<String, Object>> selectReview(Map<String, Object> map, HttpSession session) throws Exception {
//		// TODO Auto-generated method stub
//		String m_id = (String)session.getAttribute("m_id");
//		map.put("m_id", m_id);
//		return reviewDAO.selectReview(map);
//	}
	//리뷰 페이징 리스트
	
	  @Override 
	  public Map<String, Object>selectReview(Map<String, Object> map, HttpSession session)throws Exception { 
		  String m_id = (String)session.getAttribute("m_id");
			map.put("m_id", m_id);
			return reviewDAO.selectReview(map);
	  }

	@Override
	public void insertReview(Map<String, Object> map, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		String m_id = (String)session.getAttribute("m_id");
			
		map.put("m_id", m_id);
		
		reviewDAO.insertReview(map);
		
	}

	@Override
	public void updateReview(Map<String, Object> map, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		String m_id = (String)session.getAttribute("m_id");
		map.put("m_id", m_id);
		reviewDAO.updateReview(map);
		
	}

	@Override
	public void deleteReview(Map<String, Object> map, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		String m_id = (String)session.getAttribute("m_id");
		map.put("m_id", m_id);
		reviewDAO.deleteReview(map);
		
	}


}
