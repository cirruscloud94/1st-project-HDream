package com.honeydream.owner.downloadFile.service;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.owner.downloadFile.dao.downloadFileDAO;

@Service("downloadFileService")
public class downloadFileServiceImpl implements downloadFileService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="downloadFileDAO")
	private downloadFileDAO downloadfileDAO;

	@Override
	public Map<String, Object> selectFileInfoFromCafeinfo(Map<String, Object> map, HttpSession session) throws Exception {
		
		String m_id = (String)session.getAttribute("m_id");
		map.put("m_id", m_id);
		
		return downloadfileDAO.selectFileInfoFromCafeinfo(map);
	}

	@Override
	public Map<String, Object> selectFileInfoFromGoodsreg(Map<String, Object> map, HttpSession session) throws Exception {
		
		String m_id = (String)session.getAttribute("m_id");
		map.put("m_id", m_id);
		
		return downloadfileDAO.selectFileInfoFromGoodsreg(map);
	}

}
