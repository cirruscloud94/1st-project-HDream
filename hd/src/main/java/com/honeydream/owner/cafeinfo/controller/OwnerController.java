package com.honeydream.owner.cafeinfo.controller;

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
import com.honeydream.owner.cafeinfo.service.OwnerService;

@Controller
public class OwnerController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="ownerService")
	private OwnerService ownerService;
	
	@RequestMapping(value="/owner/openCafeList")
	public ModelAndView cafeInfoList(Map<String,Object> commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/owner/cafeinfoList");

		List<Map<String,Object>> list = ownerService.selectCafeInfoList(commandMap, session);
		
		mv.addObject("list", list);
		
		return mv;
		
	}
	
	@RequestMapping(value="/owner/openCafeWrite")
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/owner/cafeReg");
		
		return mv;
	}
	
	@RequestMapping(value="/owner/insertCafeinfoTable")
	public ModelAndView insertCafeinfoTable(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/owner/openCafeList");
	
		ownerService.insertCafeinfoTable(commandMap.getMap(), request);
		
		return mv;
	}
	
	@RequestMapping(value="/owner/openCafeinfoDetail")
	public ModelAndView openCafeinfoDetail(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/owner/cafeinfoDetail");
		
		//상세내용은 리스트가 아니라 하나의 행만 조회하기 때문에 Map형태의 결과값을 받도록 설정
		Map<String,Object> map = ownerService.selectCafeinfoDetail(commandMap.getMap(), session);
		
		String cafetel = (String)map.get("CAFE_TEL");
		String tel1 = cafetel.substring(0, 3);
		String tel2 = cafetel.substring(3, 7);
		String tel3 = cafetel.substring(7);
		String viewcafetel = tel1 + "-" + tel2 + "-" + tel3;
	
		int readytooff = Integer.parseInt(String.valueOf(map.get("CAFE_OFFDAY")));
		String cafeoffday = null;
		
		switch (readytooff) {	
		case 0:		
			cafeoffday = "일";
			break;
		case 1:		
			cafeoffday = "월";
			break;
		case 2:
			cafeoffday = "화";
			break;
		case 3:
			cafeoffday = "수";
			break;
		case 4:
			cafeoffday = "목";
			break;
		case 5:
			cafeoffday = "금";
			break;
		case 6:
			cafeoffday = "토";
			break;
		default:
			cafeoffday = "없음";
			break;
			
		}
		
		String cafeopenhour = (String)map.get("CAFE_OPENHOUR");
		String hourpart1 = cafeopenhour.substring(0, 2);
		String hourpart2 = cafeopenhour.substring(2, 4);
		String viewcafeopenhour = hourpart1 + ":" + hourpart2;
		
		String cafeclosehour = (String)map.get("CAFE_CLOSEHOUR");
		String part1 = cafeclosehour.substring(0, 2);
		String part2 = cafeclosehour.substring(2, 4);
		String viewcafeclosehour = part1 + ":" + part2;
		
		
		map.put("viewcafetel", viewcafetel);
		map.put("cafeoffday", cafeoffday);
		map.put("viewcafeopenhour", viewcafeopenhour);
		map.put("viewcafeclosehour", viewcafeclosehour);

		mv.addObject("map", map);

		return mv;

	}
	
	@RequestMapping(value="/owner/openCafeUpdate")
	public ModelAndView openCafeUpdate(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/owner/cafeinfoModify");
		
		Map<String, Object> map = ownerService.selectCafeinfoDetail(commandMap.getMap(), session);
		
		String getwholevalue = (String)map.get("CAFE_ACCOUNTINFO");
		int indexofcomma = getwholevalue.indexOf(","); 
		String accountnumber = getwholevalue.substring(indexofcomma+2);
		
		String bankname = getwholevalue.substring(0, indexofcomma);
		
		map.put("accountnumber", accountnumber);
		map.put("bankname", bankname);
		
		
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/owner/updateCafeinfo")
	public ModelAndView updateCafeinfo(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/owner/openCafeinfoDetail");
		
		ownerService.updateCafeinfo(commandMap.getMap(), session);
		
		mv.addObject("CAFE_IDX", commandMap.get("CAFE_IDX"));
		return mv;
	}
	
	@RequestMapping(value="/owner/deleteCafeinfo")
	public ModelAndView deleteCafeinfo(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/owner/openCafeList");
		
		ownerService.deleteCafeinfo(commandMap.getMap());
		
		return mv;
	}
	
	
	
	
	
	
}



























