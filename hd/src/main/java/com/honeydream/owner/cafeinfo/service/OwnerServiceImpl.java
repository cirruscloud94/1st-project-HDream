package com.honeydream.owner.cafeinfo.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public List<Map<String, Object>> selectCafeInfoList(Map<String, Object> map) throws Exception {

		return ownerDAO.selectCafeInfoList(map);
	}

	@Override
	public void insertCafeinfoTable(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		ownerDAO.insertCafeinfoTable(map);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++) {
			ownerDAO.insertFileOfCafeinfo(list.get(i));
			}
		}
		
	}





















