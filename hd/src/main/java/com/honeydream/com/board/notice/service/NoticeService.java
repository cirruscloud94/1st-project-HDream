package com.honeydream.com.board.notice.service;

import java.util.Map;

public interface NoticeService {
	
	/*
	 * //공지사항 리스트 
	 * List<Map<String, Object>>noticeList(Map<String, Object> map) throws Exception;
	 */
	
	//공지사항 페이징 리스트 & 검색
	Map<String, Object>noticeList(Map<String, Object> map) throws Exception;
	
	//공지사항 상세
	Map<String, Object>noticeDetail(Map<String, Object> map) throws Exception;
	
	//공지사항 글쓰기
	void noticeWrite(Map<String, Object> map) throws Exception;
	
	//공지사항 수정
	void noticeUpdate(Map<String, Object> map) throws Exception;
	
	//공지사항 삭제
	void noticeDelete(Map<String, Object> map) throws Exception;
	
	/*
	 * //공지사항 검색 
	 * List<Map<String, Object>>noticeSearch(Map<String, Object> map) throws Exception;
	 */
}