package com.honeydream.owner.goods.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface GoodsService {

	Map<String, Object> selectGoodsList(Map<String, Object> map, HttpSession session) throws Exception;

	void insertOwnerGoodsRegTable(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> selectGoodsDetail(Map<String, Object> map, HttpSession session) throws Exception;

	void updateGoods(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void deleteGoods(Map<String, Object> map) throws Exception;
	

}
