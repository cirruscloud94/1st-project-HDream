package com.honeydream.owner.cafeinfo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.common.util.FileUtils;
import com.honeydream.owner.cafeinfo.dao.OwnerDAO;

@Service("ownerService")
public class OwnerServiceImpl implements OwnerService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="ownerDAO")
	private OwnerDAO ownerDAO;

	@Override
	public List<Map<String, Object>> selectCafeInfoList(Map<String, Object> map, HttpSession session) throws Exception {

		String m_id = (String)session.getAttribute("m_id");
		map.put("m_id", m_id);
		
		return ownerDAO.selectCafeInfoList(map);
	}

	@Override
	public void insertCafeinfoTable(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		String selectbank = (String)map.get("selectbank");
		String bankaccount = (String)map.get("bankaccount");
		String accountinfo = (String)(selectbank + ", " + bankaccount);
		
		map.put("CAFE_ACCOUNTINFO", accountinfo);
		
		HttpSession session = request.getSession(); 
		String cafe_own_id = (String)session.getAttribute("m_id");
		map.put("CAFE_OWN_ID", cafe_own_id);
		
		ownerDAO.insertCafeinfoTable(map);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);	
		for(int i=0, size=list.size(); i<size; i++) {
			ownerDAO.insertFileOfCafeinfo(list.get(i));
			}
		}

	@Override
	public Map<String, Object> selectCafeinfoDetail(Map<String, Object> map, HttpSession session) throws Exception {
	
		String m_id = (String)session.getAttribute("m_id");
		map.put("m_id", m_id);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = ownerDAO.selectCafeinfoDetail(map);
		
		String cafetel = (String)tempMap.get("CAFE_TEL");
		String tel1 = cafetel.substring(0, 3);
		String tel2 = cafetel.substring(3, 7);
		String tel3 = cafetel.substring(7);
		String viewcafetel = tel1 + "-" + tel2 + "-" + tel3;
	
		int readytooff = Integer.parseInt(String.valueOf(tempMap.get("CAFE_OFFDAY")));
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
		
		String cafeopenhour = (String)tempMap.get("CAFE_OPENHOUR");
		String hourpart1 = cafeopenhour.substring(0, 2);
		String hourpart2 = cafeopenhour.substring(2, 4);
		String viewcafeopenhour = hourpart1 + ":" + hourpart2;
		
		String cafeclosehour = (String)tempMap.get("CAFE_CLOSEHOUR");
		String part1 = cafeclosehour.substring(0, 2);
		String part2 = cafeclosehour.substring(2, 4);
		String viewcafeclosehour = part1 + ":" + part2;
		
		
		tempMap.put("viewcafetel", viewcafetel);
		tempMap.put("cafeoffday", cafeoffday);
		tempMap.put("viewcafeopenhour", viewcafeopenhour);
		tempMap.put("viewcafeclosehour", viewcafeclosehour);
		
		String getwholevalue = (String)tempMap.get("CAFE_ACCOUNTINFO");
		
		int indexofcomma = getwholevalue.indexOf(","); 
		String accountnumber = getwholevalue.substring(indexofcomma+2);
		
		String bankname = getwholevalue.substring(0, indexofcomma);
		
		tempMap.put("accountnumber", accountnumber);
		tempMap.put("bankname", bankname);

		resultMap.put("map", tempMap);
		
		List<Map<String, Object>> list = ownerDAO.selectFileListFromCafeinfo(map);
		resultMap.put("list", list);
		
		return resultMap;
	}

	@Override
	public void updateCafeinfo(Map<String, Object> map, HttpSession session, HttpServletRequest request) throws Exception {
		
		String selectbank = (String)map.get("selectbank");
		String bankaccount = (String)map.get("bankaccount");
		String accountinfo = (String)(selectbank + ", " + bankaccount);
		
		map.put("CAFE_ACCOUNTINFO", accountinfo);
		
		String cafe_own_id = (String)session.getAttribute("m_id");
		map.put("CAFE_OWN_ID", cafe_own_id);

		ownerDAO.updateCafeinfo(map);
		
		ownerDAO.deleteFileListOfCafeinfo(map);
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo(map, request);
		Map<String,Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++){
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				ownerDAO.insertFileOfCafeinfo(tempMap);
			}
			else{
				ownerDAO.updateFileOfCafeinfo(tempMap);
			}
		}
	}

	@Override
	public void deleteCafeinfo(Map<String, Object> map) throws Exception {
		
		ownerDAO.deleteCafeinfo(map);
		ownerDAO.deleteGoodsOfDeletedCafeinfo(map);
		
	}
		
	}





















