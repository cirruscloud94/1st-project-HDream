package com.honeydream.com.board.notice.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO{
	
	/*
	 * //공지사항 리스트
	 * @SuppressWarnings("unchecked") 
	 * public List<Map<String, Object>>noticeList(Map<String, Object> map) throws Exception {
	 * 	return(List<Map<String, Object>>)selectList("notice.noticeList"); 
	 * }
	 */
	
	//공지사항 페이징 리스트 & 검색
	@SuppressWarnings("unchecked")
	public Map<String, Object>noticeList(Map<String, Object> map) throws Exception {
		return(Map<String, Object>)selectPagingList("notice.noticeList", map);
	}
	
	//공지사항 상세
	@SuppressWarnings("unchecked")
	public Map<String, Object>noticeDetail(Map<String, Object> map) throws Exception {
		return(Map<String, Object>)selectOne("notice.noticeDetail", map);
	}
	
	//공지사항 글쓰기
	public void noticeWrite(Map<String, Object> map) throws Exception {
		insert("notice.noticeWrite", map);
	}
	
	//조회수
	public void noticeUpdateHitCnt(Map<String, Object> map) throws Exception {
		update("notice.noticeUpdateHitCnt", map);
	}
	
	//공지사항 수정
	public void noticeUpdate(Map<String, Object> map) throws Exception {
		update("notice.noticeUpdate", map);
	}
	
	//공지사항 삭제
	public void noticeDelete(Map<String, Object> map) throws Exception {
		delete("notice.noticeDelete", map);
	}
	
	/*
	 * @SuppressWarnings("unchecked") 
	 * //공지사항 검색 
	 * public List<Map<String, Object>>noticeSearch(Map<String, Object> map) throws Exception {
	 * 	return(List<Map<String, Object>>)selectList("notice.noticeSearch", map); 
	 * }
	 */
}