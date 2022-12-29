package com.honeydream.com.board.notice.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.com.board.notice.dao.NoticeDAO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="noticeDAO")
	private NoticeDAO noticeDAO;
	
	/*
	 * //공지사항 리스트
	 * @Override 
	 * public List<Map<String, Object>>noticeList(Map<String, Object> map) throws Exception {
	 * 	return noticeDAO.noticeList(map); 
	 * }
	 */
	
	//공지사항 페이징 리스트 & 검색
	@Override
	public Map<String, Object>noticeList(Map<String, Object> map) throws Exception {
		return noticeDAO.noticeList(map);
	}
	
	//공지사항 상세
	@Override
	public Map<String, Object>noticeDetail(Map<String, Object> map) throws Exception {
		noticeDAO.noticeUpdateHitCnt(map);
		
		Map<String, Object> resultMap = noticeDAO.noticeDetail(map);
		
		return resultMap;
	}
	
	//공지사항 글쓰기
	@Override
	public void noticeWrite(Map<String, Object> map) throws Exception {
		noticeDAO.noticeWrite(map);
	}
	
	//공지사항 수정
	@Override
	public void noticeUpdate(Map<String, Object> map) throws Exception {
		noticeDAO.noticeUpdate(map);
	}
	
	//공지사항 삭제
	@Override
	public void noticeDelete(Map<String, Object> map) throws Exception {
		noticeDAO.noticeDelete(map);
	}
	
	/*
	 * //공지사항 검색
	 * @Override 
	 * public List<Map<String, Object>>noticeSearch(Map<String, Object>map) throws Exception { 
	 * 	return noticeDAO.noticeSearch(map); 
	 * }
	 */
}