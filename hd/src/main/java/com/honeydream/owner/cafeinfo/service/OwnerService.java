package com.honeydream.owner.cafeinfo.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface OwnerService {

	List<Map<String, Object>> selectCafeInfoList(Map<String, Object> map, HttpSession session) throws Exception;

	void insertCafeinfoTable(Map<String, Object> map, HttpServletRequest request) throws Exception;

}