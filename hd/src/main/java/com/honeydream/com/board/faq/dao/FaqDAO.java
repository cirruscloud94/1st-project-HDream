package com.honeydream.com.board.faq.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("faqDAO")
public class FaqDAO extends AbstractDAO{
	
	/*
	 * //FAQ 리스트
	 * @SuppressWarnings("unchecked") 
	 * public List<Map<String, Object>>faqList(Map<String, Object> map) throws Exception {
	 * 	return(List<Map<String, Object>>)selectList("faq.faqList"); 
	 * }
	 */
	
	//FAQ 페이징 리스트 & 검색
	@SuppressWarnings("unchecked")
	public Map<String, Object>faqList(Map<String, Object> map) throws Exception {
		return(Map<String, Object>)selectPagingList("faq.faqList", map);
	}
	
	//FAQ 상세
	@SuppressWarnings("unchecked")
	public Map<String, Object>faqDetail(Map<String, Object> map) throws Exception {
		return(Map<String, Object>)selectOne("faq.faqDetail", map);
	}
	
	//FAQ 글쓰기
	public void faqWrite(Map<String, Object> map) throws Exception {
		insert("faq.faqWrite", map);
	}
	
	//조회수
	public void faqUpdateHitCnt(Map<String, Object> map) throws Exception {
		update("faq.faqUpdateHitCnt", map);
	}
	
	//FAQ 수정
	public void faqUpdate(Map<String, Object> map) throws Exception {
		update("faq.faqUpdate", map);
	}
	
	//FAQ 삭제
	public void faqDelete(Map<String, Object> map) throws Exception {
		delete("faq.faqDelete", map);
	}
	
	/*
	 * @SuppressWarnings("unchecked") 
	 * //FAQ 검색 
	 * public List<Map<String, Object>>faqSearch(Map<String, Object> map) throws Exception {
	 * 	return(List<Map<String, Object>>)selectList("faq.faqSearch", map); 
	 * }
	 */
}