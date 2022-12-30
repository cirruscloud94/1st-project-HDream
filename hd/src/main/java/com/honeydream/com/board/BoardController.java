package com.honeydream.com.board;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.com.board.faq.service.FaqService;
import com.honeydream.com.board.notice.service.NoticeService;
import com.honeydream.com.board.qna.service.QnaService;
import com.honeydream.common.domain.CommandMap;

@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	@Resource(name="faqService")
	private FaqService faqService;
	
	@Resource(name="qnaService")
	private QnaService qnaService;
	
	//고객센터 리스트
	@RequestMapping("/cs")
	public ModelAndView boardList(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/cs/list");
		commandMap.put("PAGE_ROW", 5);
		commandMap.put("m_id", session.getAttribute("m_id"));
		
		Map<String, Object> noticeList = noticeService.noticeList(commandMap.getMap());
		Map<String, Object> qnaList = qnaService.qnaList(commandMap.getMap());
		Map<String, Object> faqList = faqService.faqList(commandMap.getMap());
		
		mv.addObject("notice", noticeList.get("result"));
		mv.addObject("qna", qnaList.get("result"));
		mv.addObject("faq", faqList.get("result"));
		
		return mv;
	}
}