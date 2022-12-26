package com.honeydream.com.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
	public ModelAndView boardList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/cs/list");
		
		Map<String, Object> noticeList = noticeService.noticeList(commandMap.getMap());
		List<Map<String, Object>> qnaList = qnaService.qnaList(commandMap.getMap());
		List<Map<String, Object>> faqList = faqService.faqList(commandMap.getMap());
		
		mv.addObject("notice", noticeList.get("result"));
		mv.addObject("qna", qnaList);
		mv.addObject("faq", faqList);
		
		return mv;
	}
}