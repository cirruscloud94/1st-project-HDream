package com.honeydream.com.main.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.com.board.notice.service.NoticeService;
import com.honeydream.com.main.service.MainService;
import com.honeydream.common.domain.CommandMap;

@Controller
public class MainController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mainService")
	private MainService mainService;
	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	private boolean isNull(Object obj) {
		if(obj == null) return true;
		if(obj.toString().equals("")) return true;
		return false;
	}
	
	@RequestMapping("/main")
    public ModelAndView mainBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/main");
    	//메인 배너
    	Date date = new Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
    	mv.addObject("date",sdf.format(date));
    	
    	//정렬 값이 있다면
    	if(!isNull(commandMap.get("order"))) mv.addObject("order", commandMap.get("order"));
    	
    	//검색 값이 있다면
    	if(!isNull(commandMap.get("search_keyword"))) mv.addObject("search_keyword", commandMap.get("search_keyword"));
    	if(!isNull(commandMap.get("search_type"))) mv.addObject("search_type", commandMap.get("search_type"));

    	//지도보기 선택 시
    	if(!isNull(commandMap.get("print"))) mv.addObject("print", commandMap.get("print"));
    	
    	//메인 리스트
    	//commandMap.put("PAGE_ROW", 30);
    	Map<String,Object> prd_list = mainService.mainList(commandMap.getMap());
    	mv.addObject("prd_list", prd_list.get("result"));
    	mv.addObject("paginationInfo", (PaginationInfo)prd_list.get("paginationInfo"));
    	
    	//한줄 공지
    	commandMap.put("PAGE_ROW", 5);
    	Map<String, Object> notice_list = noticeService.noticeList(commandMap.getMap());
		mv.addObject("notice_list", notice_list.get("result"));
    	
    	return mv;
    }
}
