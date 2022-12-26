package com.honeydream.com.board.qna.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("qnaDAO")
public class QnaDAO extends AbstractDAO {
	
	//Q&A 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>>qnaList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("qna.qnaList");
	}
	
	//Q&A 상세
	@SuppressWarnings("unchecked")
	public Map<String, Object>qnaDetail(Map<String, Object> map) throws Exception {
		return(Map<String, Object>)selectOne("qna.qnaDetail", map);
	}
	
	//Q&A 글쓰기
	public void qnaWrite(Map<String, Object> map) throws Exception {
		insert("qna.qnaWrite", map);
	}
	
	//조회수
	public void qnaUpdateHitCnt(Map<String, Object> map) throws Exception {
		update("qna.qnaUpdateHitCnt", map);
	}
	
	//Q&A 삭제
	public void qnaDelete(Map<String ,Object> map) throws Exception {
		delete("qna.qnaDelete", map);
	}
	
	//Q&A 답변
	public void qnaAnswer(Map<String, Object> map) throws Exception {
		insert("qna.qnaAnswer", map);
	}
	
	//Q&A 답변 삭제
	public void qnaAnswerDelete(Map<String, Object> map) throws Exception {
		delete("qna.qnaAnswerDelete", map);
	}
	
	//Q&A 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>>qnaSearch(Map<String, Object> map) throws Exception {
		return(List<Map<String, Object>>)selectList("qna.qnaSearch", map);
	}
}