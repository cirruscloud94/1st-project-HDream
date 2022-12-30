package com.honeydream.com.board.qna.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.com.board.qna.service.QnaService;
import com.honeydream.common.domain.CommandMap;

@Controller
public class QnaController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="qnaService")
	private QnaService qnaService;
	
	/*
	 * //Q&A 리스트
	 * @GetMapping(value="/admin/qnaList") 
	 * public ModelAndView qnaList(Map<String, Object> commandMap) throws Exception { 
	 * 	ModelAndView mv = new ModelAndView("/admin/cs/qna/qnaList");
	 * 
	 * 	List<Map<String, Object>> list = qnaService.qnaList(commandMap);
	 * 	mv.addObject("list", list);
	 * 
	 * 	return mv; 
	 * }
	 */
	
	//Q&A 페이징 리스트 & 검색
	@RequestMapping(value="/admin/qnaList")
	public ModelAndView qnaList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/cs/qna/qnaList");
			
		Map<String, Object> resultMap = qnaService.qnaList(commandMap.getMap());
		mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
		mv.addObject("list", resultMap.get("result"));

		return mv;
	}
	
	//Q&A 상세
	@RequestMapping(value="/admin/qnaDetail")
	public ModelAndView qnaDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/cs/qna/qnaDetail");
		
		List<Map<String, Object>> list = qnaService.qnaDetail(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
	//Q&A 글쓰기, 답변 쓰기
	@RequestMapping(value={"/admin/qnaWrite", "/admin/qnaAnswer"})
	public ModelAndView qnaWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/qnaList");
		
		qnaService.qnaWrite(commandMap.getMap());
		
		return mv;
	}
	
	//Q&A 삭제
	@RequestMapping(value="/admin/qnaDelete")
	public ModelAndView qnaDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/qnaList");
		
		qnaService.qnaDelete(commandMap.getMap());
		
		return mv;
	}
	
	//Q&A 답변 폼
	@RequestMapping(value="/admin/qnaAnswerForm")
	public ModelAndView qnaAnswerForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/cs/qna/qnaAnswer");
		
		List<Map<String, Object>> list = qnaService.qnaDetail(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
	//Q&A 답변 수정 폼
	@RequestMapping(value="/admin/qnaAnswerUpdateForm")
	public ModelAndView qnaAnswerUpdateForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/cs/qna/qnaAnswerUpdate");
		
		List<Map<String, Object>> list = qnaService.qnaDetail(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
	//Q&A 답변 수정
	@RequestMapping(value="/admin/qnaAnswerUpdate")
	public ModelAndView qnaAnswerUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/qnaList");
		
		qnaService.qnaAnswerUpdate(commandMap.getMap());	
		mv.addObject("B_QNA_IDX", commandMap.get("B_QNA_IDX"));
	
		return mv;
	}
	
	//Q&A 답변 삭제
	@RequestMapping(value="/admin/qnaAnswerDelete")
	public ModelAndView qnaAnswerDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/qnaDetail");
		
		qnaService.qnaAnswerDelete(commandMap.getMap());
		
		return mv;
	}
	
	/*
	 * //Q&A 검색
	 * @PostMapping(value="/admin/qnaList") 
	 * public ModelAndView qnaSearch(CommandMap commandMap) throws Exception { 
	 * 	ModelAndView mv = new ModelAndView("/admin/cs/qna/qnaList");
	 * 
	 * 	List<Map<String, Object>> list = qnaService.qnaSearch(commandMap.getMap());
	 * 	mv.addObject("list", list);
	 * 
	 * 	return mv; 
	 * }
	 */
	
	//Q&A 리스트 유저용 & 검색
	@RequestMapping(value="/cs/qnaList")
	public ModelAndView csQnaList(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/cs/qna/qnaList");
		commandMap.put("m_id", session.getAttribute("m_id"));
		Map<String, Object> resultMap = qnaService.qnaList(commandMap.getMap());
		mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
		mv.addObject("list", resultMap.get("result"));

		return mv;
	}
		
	//Q&A 상세 유저용
	@RequestMapping(value="/cs/qnaDetail")
	public ModelAndView csQnaDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/cs/qna/qnaDetail");
			
		List<Map<String, Object>> list = qnaService.qnaDetail(commandMap.getMap());
		mv.addObject("list", list);
			
		return mv;
	}
	//Q&A 글쓰기 폼 유저용
	@RequestMapping(value="/cs/qnaWriteForm")
	public ModelAndView csQnaWriteForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/cs/qna/qnaWrite");
			
		return mv;
	}
		
	//Q&A 글쓰기 유저용
	@RequestMapping(value="/cs/qnaWrite")
	public ModelAndView csQnaWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/cs/qnaList");
			
		qnaService.qnaWrite(commandMap.getMap());
			
		return mv;
	}
	
	//Q&A 삭제 유저용
	@RequestMapping(value="/cs/qnaDelete")
	public ModelAndView csQnaDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/cs/qnaList");
			
		qnaService.qnaDelete(commandMap.getMap());
			
		return mv;
	}
}