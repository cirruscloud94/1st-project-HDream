package com.honeydream.com.board.notice.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.com.board.notice.service.NoticeService;
import com.honeydream.common.domain.CommandMap;

@Controller
public class NoticeController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	/*
	 * //공지사항 리스트
	 * @GetMapping(value="/admin/noticeList")
	 * public ModelAndView noticeList(Map<String, Object> commandMap) throws Exception { 
	 * 	ModelAndView mv = new ModelAndView("/admin/cs/notice/noticeList");
	 * 
	 * 	List<Map<String, Object>> list = noticeService.noticeList(commandMap);
	 * 	mv.addObject("list", list);
	 * 
	 * 	return mv; 
	 * }
	 */
	
	//공지사항 페이징 리스트 & 검색
	@RequestMapping(value="/admin/noticeList")
	public ModelAndView noticeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/cs/notice/noticeList");
		
		Map<String, Object> resultMap = noticeService.noticeList(commandMap.getMap());
		mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
		mv.addObject("list", resultMap.get("result"));

		return mv;
	}
	
	//공지사항 상세
	@RequestMapping(value="/admin/noticeDetail")
	public ModelAndView noticeDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/cs/notice/noticeDetail");
		
		Map<String, Object> map = noticeService.noticeDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}
	
	//공지사항 글쓰기 폼
	@RequestMapping(value="/admin/noticeWriteForm")
	public ModelAndView noticeWriteForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/cs/notice/noticeWrite");
		
		return mv;
	}
	
	//공지사항 글쓰기
	@RequestMapping(value="/admin/noticeWrite")
	public ModelAndView noticeWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeList");
		noticeService.noticeWrite(commandMap.getMap());
		
		return mv;
	}
	
	//공지사항 수정 폼
	@RequestMapping(value="/admin/noticeUpdateForm")
	public ModelAndView noticeUpdateForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/cs/notice/noticeUpdate");
		
		Map<String, Object> map = noticeService.noticeDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	//공지사항 수정
	@RequestMapping(value="/admin/noticeUpdate")
	public ModelAndView noticeUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeDetail");
		
		noticeService.noticeUpdate(commandMap.getMap());	
		mv.addObject("B_INFO_IDX", commandMap.get("B_INFO_IDX"));
		
		return mv;
	}
	
	//공지사항 삭제
	@RequestMapping(value="/admin/noticeDelete")
	public ModelAndView noticeDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeList");
		
		noticeService.noticeDelete(commandMap.getMap());
		
		return mv;
	}
	
	/*
	 * //공지사항 검색
	 * @PostMapping(value="/admin/noticeList") 
	 * public ModelAndView noticeSearch(CommandMap commandMap) throws Exception { 
	 * 	ModelAndView mv = new ModelAndView("/admin/cs/notice/noticeList");
	 * 
	 * 	List<Map<String, Object>> list = noticeService.noticeSearch(commandMap.getMap()); 
	 * 	mv.addObject("list", list);
	 * 	
	 * 	return mv; 
	 * }
	 */
	
	//공지사항 리스트 유저용 & 검색
	@RequestMapping(value="/cs/noticeList")
	public ModelAndView csNoticeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/cs/notice/noticeList");
		
		Map<String, Object> resultMap = noticeService.noticeList(commandMap.getMap());
		mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
		mv.addObject("list", resultMap.get("result"));
		
		return mv;
	}
		
	//공지사항 상세 유저용
	@RequestMapping(value="/cs/noticeDetail")
	public ModelAndView csnNticeDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/cs/notice/noticeDetail");
		
		Map<String, Object> map = noticeService.noticeDetail(commandMap.getMap());
		mv.addObject("map", map);
	
		return mv;
	}
}