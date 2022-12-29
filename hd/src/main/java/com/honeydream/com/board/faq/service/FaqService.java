package com.honeydream.com.board.faq.service;

import java.util.Map;

public interface FaqService {
	
	/*
	 * //FAQ 리스트 
	 * List<Map<String, Object>>faqList(Map<String, Object> map) throws Exception;
	 */
	
	//FAQ 페이징 리스트 & 검색
	Map<String, Object>faqList(Map<String, Object> map) throws Exception;
	
	//FAQ 상세
	Map<String, Object>faqDetail(Map<String, Object> map) throws Exception;
	
	//FAQ 글쓰기
	void faqWrite(Map<String, Object> map) throws Exception;
	
	//FAQ 수정
	void faqUpdate(Map<String, Object> map) throws Exception;
	
	//FAQ 삭제
	void faqDelete(Map<String, Object> map) throws Exception;
	
	/*
	 * //FAQ 검색 
	 * List<Map<String, Object>>faqSearch(Map<String, Object> map) throws Exception;
	 */
}
