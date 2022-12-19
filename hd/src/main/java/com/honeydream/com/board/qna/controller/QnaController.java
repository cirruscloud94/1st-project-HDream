package com.honeydream.com.board.qna.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.com.board.qna.service.QnaService;
import com.honeydream.common.domain.CommandMap;

@Controller
public class QnaController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="qnaService")
	private QnaService qnaService;
	
	//Q&A 리스트
	@GetMapping(value="/admin/qnaList")
	public ModelAndView qnaList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/cs/qna/qnaList");
		
		List<Map<String, Object>> list = qnaService.qnaList(commandMap);
		mv.addObject("list", list);
		
		return mv;
	}
	
	//Q&A 상세
	@RequestMapping(value="/admin/qnaDetail")
	public ModelAndView qnaDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/cs/qna/qnaDetail");
		
		Map<String, Object> map = qnaService.qnaDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	//Q&A 글쓰기 폼
	@RequestMapping(value="/admin/qnaWriteForm")
	public ModelAndView qnaWriteForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/cs/qna/qnaWrite");
		
		return mv;
	}
	
	//Q&A 글쓰기
	@RequestMapping(value="/admin/qnaWrite")
	public ModelAndView qnaWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/cs/qna/qnaList");
		
		qnaService.qnaWrite(commandMap.getMap(), request);
		
		return mv;
	}
	
	//Q&A 수정 폼
	@RequestMapping(value="/admin/qnaUpdateForm")
	public ModelAndView qnaUpdateForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/cs/qna/qnaUpdate");
		
		Map<String, Object> map = qnaService.qnaDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	//Q&A 수정
	@RequestMapping(value="/admin/qnaUpdate")
	public ModelAndView qnaUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/cs/qna/qnaDetail");
		
		qnaService.qnaUpdate(commandMap.getMap());
		mv.addObject("B_QNA_IDX", commandMap.get("B_QNA_IDX"));
		
		return mv;
	}
	
	//Q&A 삭제
	@RequestMapping(value="/admin/qnaDelete")
	public ModelAndView qnaDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/cs/qna/qnaList");
		
		qnaService.qnaDelete(commandMap.getMap());
		
		return mv;
	}
	
	//Q&A 답변 폼
	@RequestMapping(value="/admin/qnaAnswerForm")
	public ModelAndView qnaAnswerForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/cs/qna/qnaAnswer");
		
		Map<String, Object> map = qnaService.qnaDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	//Q&A 답변
	@RequestMapping(value="/admin/qnaAnswer")
	public ModelAndView qnaAnswer(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/cs/qna/qnaDetail");
		
		qnaService.qnaAnswer(commandMap.getMap());
		mv.addObject("B_QNA_IDX", commandMap.get("B_QNA_IDX"));
		
		return mv;
	}
	
	//Q&A 답변 삭제
	@RequestMapping(value="/admin/qnaAnswerDelete")
	public ModelAndView qnaAnswerDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/cs/qna/qnaDetail");
		
		qnaService.qnaAnswerDelete(commandMap.getMap());
		
		return mv;
	}
	
	//Q&A 검색
	@PostMapping(value="/admin/qnaList")
	public ModelAndView qnaSearch(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/cs/qna/qnaList");
		
		List<Map<String, Object>> list = qnaService.qnaSearch(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
}