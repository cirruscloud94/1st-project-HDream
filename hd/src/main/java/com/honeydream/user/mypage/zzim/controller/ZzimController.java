package com.honeydream.user.mypage.zzim.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.common.domain.CommandMap;
import com.honeydream.user.mypage.zzim.service.ZzimService;

@Controller
public class ZzimController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="zzimService")
	private ZzimService zzimService;
	
	@RequestMapping(value="/user/mypage/zzim/list")
	public ModelAndView selectUserInfo(CommandMap commandMap , HttpSession session) throws Exception {

		ModelAndView m = new ModelAndView("user/mypage/zzim/zzimList"); //jsp의 이름
		Map<String,Object> map = zzimService.selectZzim(commandMap.getMap(), session);
		m.addObject("list", map.get("result"));
		m.addObject("paginationInfo", (PaginationInfo)map.get("paginationInfo"));
		return m;
	}
	
	 @RequestMapping("/user/mypage/deleteZzim/{cafe_idx}")
	    public ModelAndView deleteZzim(@PathVariable("cafe_idx") int cafe_idx, CommandMap commandMap, HttpSession session)throws Exception{//여러 데이터 맵형식 저장
	       ModelAndView mv = new ModelAndView("redirect:/user/mypage/zzim/list");//화면에 보여줄 jsp 파일을 의미(view)
	       commandMap.put("CAFE_IDX", cafe_idx);
	       zzimService.deleteZzim(commandMap.getMap(), session);
	       return mv; 
	 }
}
