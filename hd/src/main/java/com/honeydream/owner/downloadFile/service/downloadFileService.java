package com.honeydream.owner.downloadFile.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

public interface downloadFileService {
	
	Map<String, Object> selectFileInfoFromCafeinfo(Map<String, Object> map, HttpSession session) throws Exception;
	
	Map<String, Object> selectFileInfoFromGoodsreg(Map<String, Object> map, HttpSession session) throws Exception;

}
