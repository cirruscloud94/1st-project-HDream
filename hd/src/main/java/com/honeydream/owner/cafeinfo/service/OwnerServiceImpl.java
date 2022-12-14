package com.honeydream.owner.cafeinfo.service;

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
		
		String cafetel = (String)map.get("CAFE_TEL");
		String openhour = (String)map.get("CAFE_OPENHOUR");
		String closehour = (String)map.get("CAFE_CLOSEHOUR");
		
		
		return ownerDAO.selectCafeinfoDetail(map);
	}
		
	}





















