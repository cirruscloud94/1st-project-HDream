package com.honeydream.com.board.faq.service;

import java.util.List;
import java.util.Map;

public interface FaqService {
	
	//FAQ 리스트
	List<Map<String, Object>>faqList(Map<String, Object> map) throws Exception;
	
	//FAQ 상세
	Map<String, Object>faqDetail(Map<String, Object> map) throws Exception;
	
	//FAQ 글쓰기
	void faqWrite(Map<String, Object> map) throws Exception;
	
	//FAQ 수정
	void faqUpdate(Map<String, Object> map) throws Exception;
	
	//FAQ 삭제
	void faqDelete(Map<String, Object> map) throws Exception;
	
	//공지사항 검색
	List<Map<String, Object>>faqSearch(Map<String, Object> map) throws Exception;
}
