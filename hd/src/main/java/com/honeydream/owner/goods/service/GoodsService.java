package com.honeydream.owner.goods.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface GoodsService {

	List<Map<String, Object>> selectGoodsList(Map<String, Object> map, HttpSession session) throws Exception;

	void insertOwnerGoodsRegTable(Map<String, Object> map, HttpServletRequest request) throws Exception;

}
