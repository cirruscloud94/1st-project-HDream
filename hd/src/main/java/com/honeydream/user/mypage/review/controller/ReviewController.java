package com.honeydream.user.mypage.review.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.common.domain.CommandMap;
import com.honeydream.user.mypage.review.service.ReviewService;



@Controller
public class ReviewController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reviewService")
	private ReviewService reviewService;
	
//	@RequestMapping("/user/mypage/review/reviewList")
//	public ModelAndView reviewList( CommandMap commandMap,
//			HttpSession session) throws Exception {
//		
//		ModelAndView mv = new ModelAndView("/user/mypage/review/reviewList" );
//	
//		Map<String, Object>> list = reviewService.selectReview(commandMap.getMap(), session);
//		mv.addObject("list", list);
//		
//		return mv;
//		
//	}
	
	//리뷰 페이징 리스트
	
	  @RequestMapping(value="/user/mypage/review/reviewList") 
	  public ModelAndView reviewList(CommandMap commandMap, HttpSession session) throws Exception { 
		  ModelAndView mv = new ModelAndView("/user/mypage/review/reviewList");
	  
	  Map<String, Object> list = reviewService.selectReview(commandMap.getMap(), session);
	  mv.addObject("paginationInfo",(PaginationInfo)list.get("paginationInfo")); 
	  mv.addObject("list",list.get("result"));
	  
	  return mv; 
	  }
	 
	@RequestMapping("/user/mypage/review/insertReview")
	public ModelAndView insertReview( CommandMap commandMap,
			HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView("redirect:/user/mypage/review/reviewList" );
		
	
		
		reviewService.insertReview(commandMap.getMap(), session);
		
		return mv;
	}
	
	@RequestMapping(value = "/user/mypage/review/insertForm")
	public ModelAndView insertForm(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/user/mypage/review/insertReview");
		
		String v_r_idx = (String) commandMap.get("v_r_idx");
		String v_o_idx = (String)commandMap.get("v_o_idx");
		String v_c_idx = (String)commandMap.get("v_c_idx");
		String r_cafe_name = (String)commandMap.get("r_cafe_name");
		String r_room_name = (String)commandMap.get("r_room_name");
		
		mv.addObject("v_r_idx",v_r_idx);
		mv.addObject("v_o_idx",v_o_idx);
		mv.addObject("v_c_idx",v_c_idx);
		mv.addObject("r_cafe_name",r_cafe_name);
		mv.addObject("r_room_name",r_room_name);
		
		
		return mv;
	}

	
	@RequestMapping(value = "/user/mypage/review/updateReview")
	public ModelAndView updateReview(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/user/mypage/review/reviewList");
		
		reviewService.updateReview(commandMap.getMap(), session);
		
		
		return mv;
	}
	@RequestMapping(value = "/user/mypage/review/updateForm")
	public ModelAndView updateForm(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/user/mypage/review/updateReview");
		
		String v_idx = (String) commandMap.get("v_idx");
		String v_contents = (String)commandMap.get("v_contents");
		String v_star = (String)commandMap.get("v_star");
	
		
		mv.addObject("v_idx",v_idx);
		mv.addObject("v_contents",v_contents);
		mv.addObject("v_star",v_star);
		
		
		return mv;
	}
	
	@RequestMapping(value = "/user/mypage/review/deleteReview")
	public ModelAndView deleteReview(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/user/mypage/review/reviewList");
		
		reviewService.deleteReview(commandMap.getMap(), session);
		
		return mv;
	}
	

}
