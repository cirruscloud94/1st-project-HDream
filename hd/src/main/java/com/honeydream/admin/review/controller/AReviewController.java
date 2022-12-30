package com.honeydream.admin.review.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.admin.review.service.AReviewService;
import com.honeydream.common.domain.CommandMap;

@Controller
public class AReviewController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="areviewService")
	private AReviewService areviewService;
	
	//리뷰 페이징 리스트
	@RequestMapping(value="/admin/reviewList") 
	public ModelAndView reviewList(CommandMap commandMap) throws Exception { 
		ModelAndView mv = new ModelAndView("/admin/cs/review/reviewList");
		
		Map<String, Object> resultMap = areviewService.reviewList(commandMap.getMap());
		mv.addObject("paginationInfo",(PaginationInfo)resultMap.get("paginationInfo")); 
		mv.addObject("list",resultMap.get("result"));
		  
		return mv; 
	}
	
	//리뷰 상세
	@RequestMapping("/admin/reviewDetail")
	public ModelAndView reviewDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/cs/review/reviewDetail");
			
		Map<String, Object> map = areviewService.reviewDetail(commandMap.getMap());
		mv.addObject("map", map);
			
		return mv;
	}
	
	//리뷰 삭제
	@RequestMapping("/admin/deleteReview")
	public ModelAndView deleteReview(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/reviewList");
			
		areviewService.deleteReview(commandMap.getMap());
				
		return mv;
	}
}
