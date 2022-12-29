package com.honeydream.com.board.faq.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.com.board.faq.dao.FaqDAO;

@Service("faqService")
public class FaqServiceImpl implements FaqService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="faqDAO")
	private FaqDAO faqDAO;
	
	/*
	 * //FAQ 리스트 
	 * @Override 
	 * public List<Map<String, Object>>faqList(Map<String, Object> map) throws Exception { 
	 * 	return faqDAO.faqList(map); 
	 * }
	 */
	
	//FAQ 페이징 리스트 & 검색
	@Override
	public Map<String, Object>faqList(Map<String, Object> map) throws Exception {
		return faqDAO.faqList(map);
	}
	
	//FAQ 상세
	@Override
	public Map<String, Object>faqDetail(Map<String, Object> map) throws Exception {
		faqDAO.faqUpdateHitCnt(map);
		
		Map<String, Object> resultMap = faqDAO.faqDetail(map);
		
		return resultMap;
	}
	
	//FAQ 글쓰기
	@Override
	public void faqWrite(Map<String, Object> map) throws Exception {
		faqDAO.faqWrite(map);
	}
	
	//FAQ 수정
	@Override
	public void faqUpdate(Map<String ,Object> map) throws Exception {
		faqDAO.faqUpdate(map);
	}
	
	//FAQ 삭제
	@Override
	public void faqDelete(Map<String, Object> map) throws Exception {
		faqDAO.faqDelete(map);
	}
	
	/*
	 * //FAQ 검색 
	 * @Override 
	 * public List<Map<String, Object>>faqSearch(Map<String, Object> map) throws Exception { 
	 * 	return faqDAO.faqSearch(map); 
	 * }
	 */
}