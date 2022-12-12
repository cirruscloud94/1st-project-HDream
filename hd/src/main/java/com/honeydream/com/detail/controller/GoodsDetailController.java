package com.honeydream.com.detail.controller;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.com.detail.service.GoodsDetailService;
import com.honeydream.common.domain.CommandMap;

@Controller
public class GoodsDetailController {


	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="goodsDetailService")
	private GoodsDetailService goodsDetailService;//서비스 영역의 접근을 위한 선언, GoodsDetailServiceImpl을 사용하기 위함
	
	@RequestMapping("/com/detail/selectGoodsInfo/{cafe_idx}")//요청 url의미(value의 주소를 호출하게 되면 해당 메서드 실행
	   public ModelAndView selectGoodsInfo(@PathVariable("cafe_idx") int cafe_idx, CommandMap commandMap)throws Exception{//여러 데이터 맵형식 저장
	      ModelAndView mv = new ModelAndView("/detail/goodsDetail");//화면에 보여줄 jsp 파일을 의미(view)
	      
	      commandMap.put("CAFE_IDX", cafe_idx);
	      Map<String,Object> map = goodsDetailService.selectGoodsInfo(commandMap.getMap());//cafe_idx
	      List<Map<String,Object>> list = goodsDetailService.selectPrice(commandMap.getMap());
	      Map<String,Object> con = goodsDetailService.selectContents(commandMap.getMap());
	      List<Map<String,Object>> review = goodsDetailService.selectReview(commandMap.getMap());
	  
	      //Controller는 단순히어떤 주소와 화면을 연결, 비지니스 로직 호출(하지만 비지니스 로직은 서비스에서 작성) 
	      //기능을 Service에서 처리해주게 된다는 것
	      mv.addObject("map", map);//카페번호별 메인이미지,간략정보
	      mv.addObject("list", list);//카페번호별 옵션번호 및 가격
	      mv.addObject("con", con);//카페번호별 상세정보
	      mv.addObject("review", review);//카페번호의 옵션이름 별 전체리뷰, 별점
	      
	      return mv;
	      
	}
	/*
	 * @RequestMapping(value="/owner/reserv/selectCafePhoto")//요청 url의미(value의 주소를
	 * 호출하게 되면 해당 메서드 실행 public ModelAndView selectCafePhoto(CommandMap
	 * commandMap)throws Exception{//여러 데이터 맵형식 저장 ModelAndView mv = new
	 * ModelAndView("/user/reserv/goodsDetail");//화면에 보여줄 jsp 파일을 의미
	 * 
	 * List<Map<String,Object>> goods =
	 * reservService.selectCafePhoto(commandMap.getMap()); //Controller는 단순히어떤 주소와
	 * 화면을 연결, 비지니스 로직 호출(하지만 비지니스 로직은 서비스에서 작성) //기능을 Service에서 처리해주게 된다는 것
	 * mv.addObject("goods", goods);
	 * 
	 * //서비스 로직의 결과를 ModelAndView 객체에 담아서 jsp에서 결과를 사용할 수 있도록
	 * 
	 * return mv; }
	 */
}
	

