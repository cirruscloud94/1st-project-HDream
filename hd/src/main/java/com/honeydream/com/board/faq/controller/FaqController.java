package com.honeydream.com.board.faq.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.com.board.faq.service.FaqService;
import com.honeydream.common.domain.CommandMap;

@Controller
public class FaqController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="faqService")
	private FaqService faqService;
	
	/*
	 * //FAQ 리스트
	 * @GetMapping(value="/admin/faqList") 
	 * public ModelAndView faqList(Map<String, Object> commandMap) throws Exception { 
	 * 	ModelAndView mv = new ModelAndView("/admin/cs/faq/faqList");
	 * 
	 * 	List<Map<String, Object>> list = faqService.faqList(commandMap);
	 * 	mv.addObject("list", list);
	 * 
	 * 	return mv; 
	 * }
	 */
	
	//FAQ 페이징 리스트 & 검색
	@RequestMapping(value="/admin/faqList")
	public ModelAndView faqList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/cs/faq/faqList");
		
		Map<String, Object> resultMap = faqService.faqList(commandMap.getMap());
		mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
		mv.addObject("list", resultMap.get("result"));

		return mv;
	}
	
	//FAQ 상세
	@RequestMapping(value="/admin/faqDetail")
	public ModelAndView faqDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/cs/faq/faqDetail");
		
		Map<String, Object> map = faqService.faqDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	//FAQ 글쓰기 폼
	@RequestMapping(value="/admin/faqWriteForm")
	public ModelAndView faqWriteForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/cs/faq/faqWrite");
		
		return mv;
	}
	
	//FAQ 글쓰기
	@RequestMapping(value="/admin/faqWrite")
	public ModelAndView faqWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/faqList");
		faqService.faqWrite(commandMap.getMap());
		
		return mv;
	}
	
	//FAQ 수정 폼
	@RequestMapping(value="/admin/faqUpdateForm")
	public ModelAndView faqUpdateForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/cs/faq/faqUpdate");
		
		Map<String, Object> map = faqService.faqDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	//FAQ 수정
	@RequestMapping(value="/admin/faqUpdate")
	public ModelAndView faqUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/faqDetail");
		
		faqService.faqUpdate(commandMap.getMap());
		mv.addObject("B_FAQ_IDX", commandMap.get("B_FAQ_IDX"));
		
		return mv;
	}
	
	//FAQ 삭제
	@RequestMapping(value="/admin/faqDelete")
	public ModelAndView faqDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/faqList");
		
		faqService.faqDelete(commandMap.getMap());
		
		return mv;
	}
	
	/*
	 * //FAQ 검색
	 * @PostMapping(value="/admin/faqList") 
	 * public ModelAndView faqSearch(CommandMap commandMap) throws Exception { 
	 * 	ModelAndView mv = new ModelAndView("/admin/cs/faq/faqList");
	 * 
	 * 	List<Map<String, Object>> list = faqService.faqSearch(commandMap.getMap());
	 * 	mv.addObject("list", list);
	 * 
	 * 	return mv; 
	 * }
	 */
	 
	//FAQ 리스트 유저용 & 검색
	@RequestMapping(value="/cs/faqList")
	public ModelAndView csFaqList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/cs/faq/faqList");
		
		Map<String, Object> resultMap = faqService.faqList(commandMap.getMap());
		mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
		mv.addObject("list", resultMap.get("result"));

		return mv;
	}
		
	//FAQ 상세 유저용
	@RequestMapping(value="/cs/faqDetail")
	public ModelAndView csFaqDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/cs/faq/faqDetail");
			
		Map<String, Object> map = faqService.faqDetail(commandMap.getMap());
		mv.addObject("map", map);
			
		return mv;
	}
}
