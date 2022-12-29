package com.honeydream.com.board.qna.service;

import java.util.List;
import java.util.Map;

public interface QnaService {
	
	/*
	 * //Q&A 리스트 
	 * List<Map<String, Object>>qnaList(Map<String, Object> map) throws Exception;
	 */
	
	//Q&A 페이징 리스트 & 검색
	Map<String, Object>qnaList(Map<String, Object> map) throws Exception;
	
	//Q&A 상세
	List<Map<String, Object>>qnaDetail(Map<String, Object> map) throws Exception;
	
	//Q&A 글쓰기, 답변 쓰기
	void qnaWrite(Map<String, Object> map) throws Exception;
	
	//Q&A 삭제
	void qnaDelete(Map<String, Object> map) throws Exception;
	
	//Q&A 답변 수정
	void qnaAnswerUpdate(Map<String, Object> map) throws Exception;
	
	//Q&A 답변 삭제
	void qnaAnswerDelete(Map<String, Object> map) throws Exception;
	
	/*
	 * //Q&A 검색 
	 * List<Map<String, Object>>qnaSearch(Map<String, Object> map) throws Exception;
	 */
}