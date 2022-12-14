package com.honeydream.owner.goods.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.honeydream.common.domain.CommandMap;
import com.honeydream.owner.goods.service.GoodsService;

@Controller
public class GoodsController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="goodsService")
	private GoodsService goodsService;
	
	@RequestMapping(value="/owner/openGoodsList")
	public ModelAndView openGoodsList(Map<String,Object> commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/owner/goodsList");
		
		List<Map<String,Object>> list = goodsService.selectGoodsList(commandMap, session);
		mv.addObject("list", list);
		
		return mv;
	}
	
	@RequestMapping(value="/owner/openGoodsWrite")
	public ModelAndView openGoodsWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/owner/goodsReg");
		
		return mv;
	}
	
	@RequestMapping(value="/owner/insertOwnerGoodsRegTable")
	public ModelAndView insertOwnerGoodsRegTable(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/owner/openGoodsList");
	
		goodsService.insertOwnerGoodsRegTable(commandMap.getMap(), request);

		return mv;
				
	}
	
}























