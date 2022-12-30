package com.honeydream.com.detail.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.honeydream.com.detail.service.GoodsDetailService;
import com.honeydream.common.domain.CommandMap;

@Controller
public class GoodsDetailController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "goodsDetailService")
	private GoodsDetailService goodsDetailService;// 서비스 영역의 접근을 위한 선언, GoodsDetailServiceImpl을 사용하기 위함

	@RequestMapping("/com/detail/selectGoodsInfo/{cafe_idx}") // 요청 url의미(value의 주소를 호출하게 되면 해당 메서드 실행
	public ModelAndView selectGoodsInfo(@PathVariable("cafe_idx") int cafe_idx, CommandMap commandMap,
			HttpSession session, HttpServletRequest request) throws Exception {// 여러 데이터 맵형식 저장
		ModelAndView mv = new ModelAndView("/detail/goodsDetail");// 화면에 보여줄 jsp 파일을 의미(view)

		commandMap.put("CAFE_IDX", cafe_idx);
		

		if ((String) session.getAttribute("m_id") != null) {
			commandMap.put("cafe_idx", cafe_idx);
			Map<String, Object> checkZzim = goodsDetailService.checkZzim(commandMap.getMap(), session);
			mv.addObject("zzim", checkZzim);
		}

		Map<String, Object> map = goodsDetailService.selectGoodsInfo(commandMap.getMap());// cafe_idx
		mv.addObject("map", map);// 카페번호별 메인이미지,간략정보

		List<Map<String, Object>> mimg = goodsDetailService.selectMainImage(commandMap.getMap());
		mv.addObject("mimg", mimg);// 메인이미지 여러장 저장

		List<Map<String, Object>> list = goodsDetailService.selectPrice(commandMap.getMap());
		mv.addObject("list", list);// 카페번호별 옵션번호 및 가격

		Map<String, Object> con = goodsDetailService.selectContents(commandMap.getMap());
		mv.addObject("con", con);// 카페번호별 상세정보
		
		commandMap.put("PAGE_ROW", 4);
		Map<String, Object> review = goodsDetailService.reviewList(commandMap.getMap());
		mv.addObject("review_paginationInfo", (PaginationInfo)review.get("paginationInfo"));
		mv.addObject("review", review.get("result"));// 카페번호의 옵션이름 별 전체리뷰, 별점
		
		mv.addObject("starPoint", commandMap.get("starPoint")); // 별점 총합 (별점평가수)
		
		mv.addObject("avgSP", commandMap.get("avgSP"));
		
		Map<String, Object> reviewCount = goodsDetailService.selectReviewCount(commandMap.getMap());
		mv.addObject("rvCount", reviewCount); // 리뷰 개수
		
		// Controller는 단순히어떤 주소와 화면을 연결, 비지니스 로직 호출(하지만 비지니스 로직은 서비스에서 작성)
		// 기능을 Service에서 처리해주게 된다는 것
		return mv;
	}

	@RequestMapping("/com/detail/insertZzim/{cafe_idx}")
	public ModelAndView insertZzim(@PathVariable("cafe_idx") int cafe_idx, CommandMap commandMap, HttpSession session, RedirectAttributes rttr)
			throws Exception {// 여러 데이터 맵형식 저장

		ModelAndView mv = new ModelAndView("redirect:/com/detail/selectGoodsInfo/" + cafe_idx);// 화면에 보여줄 jsp 파일을 의미(view)
		goodsDetailService.insertZzim(commandMap.getMap(), session);
		rttr.addAttribute("starPoint", commandMap.get("starPoint")); // 별점 총합 (별점평가수)
		rttr.addAttribute("avgSP", commandMap.get("avgSP"));
		
		return mv;
	}

	@RequestMapping("/com/detail/deleteZzim/{cafe_idx}")
	public ModelAndView deleteZzim(@PathVariable("cafe_idx") int cafe_idx, CommandMap commandMap, HttpSession session, RedirectAttributes rttr)
			throws Exception {// 여러 데이터 맵형식 저장
		ModelAndView mv = new ModelAndView("redirect:/com/detail/selectGoodsInfo/" + cafe_idx);// 화면에 보여줄 jsp 파일을 의미(view)
		goodsDetailService.deleteZzim(commandMap.getMap(), session);
		rttr.addAttribute("starPoint", commandMap.get("starPoint")); // 별점 총합 (별점평가수)
		rttr.addAttribute("avgSP", commandMap.get("avgSP"));
		
		return mv;
	}

}
