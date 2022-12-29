package com.honeydream.owner.goods.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
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
	public ModelAndView openGoodsList(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/owner/goodsList");
		
		Map<String, Object> resultMap = goodsService.selectGoodsList(commandMap.getMap(), session);
		
		mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
		mv.addObject("list", resultMap.get("result"));
		
		
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
	
	@RequestMapping(value="/owner/openGoodsDetail")
	public ModelAndView openGoodsDetail(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/owner/goodsDetail");
		
		Map<String, Object> map = goodsService.selectGoodsDetail(commandMap.getMap(), session);
		mv.addObject("map", map);
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/owner/openGoodsUpdate")
	public ModelAndView openGoodsUpdate(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/owner/goodsModify");
		
		Map<String, Object> map = goodsService.selectGoodsDetail(commandMap.getMap(), session);
		
		mv.addObject("map", map);
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/owner/updateGoods")
	public ModelAndView updateGoods(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/owner/openGoodsDetail");
		
		goodsService.updateGoods(commandMap.getMap(), request);
		
		mv.addObject("GOODSREG_IDX", commandMap.get("GOODSREG_IDX"));
		
		return mv;
	}
	
	@RequestMapping(value="/owner/deleteGoods")
	public ModelAndView deleteGoods(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/owner/openGoodsList");
		
		goodsService.deleteGoods(commandMap.getMap());
		
		return mv;
		
	}

		
	
	
	
}























