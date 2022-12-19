package com.honeydream.com.board.qna.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.com.board.qna.dao.QnaDAO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="qnaDAO")
	private QnaDAO qnaDAO;

	//Q&A 리스트
	@Override
	public List<Map<String, Object>>qnaList(Map<String, Object> map) throws Exception {
		return qnaDAO.qnaList(map);
	}
	
	//Q&A 상세
	@Override
	public Map<String, Object>qnaDetail(Map<String, Object> map) throws Exception {
		qnaDAO.qnaUpdateHitCnt(map);
		
		Map<String, Object> resultMap = qnaDAO.qnaDetail(map);
		
		return resultMap;
	}
	
	//Q&A 글쓰기
	@Override
	public void qnaWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
		qnaDAO.qnaWrite(map);
	}
	
	//Q&A 수정
	@Override
	public void qnaUpdate(Map<String, Object> map) throws Exception {
		qnaDAO.qnaUpdate(map);
	}
	
	//Q&A 삭제
	@Override
	public void qnaDelete(Map<String, Object> map) throws Exception {
		qnaDAO.qnaDelete(map);
	}
	
	//Q&A 답변
	@Override
	public void qnaAnswer(Map<String, Object> map) throws Exception {
		qnaDAO.qnaAnswer(map);
	}
	
	//Q&A 답변 삭제
	@Override
	public void qnaAnswerDelete(Map<String, Object> map) throws Exception {
		qnaDAO.qnaAnswerDelete(map);
	}
	
	//Q&A 검색
	@Override
	public List<Map<String, Object>>qnaSearch(Map<String, Object> map) throws Exception {
		return qnaDAO.qnaSearch(map);
	}
}