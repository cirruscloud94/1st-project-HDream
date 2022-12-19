package com.honeydream.owner.adjustment.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface AdjustmentService {
	
	Map<String,Object> selectCafeProfit(Map<String,Object> map,HttpSession session) throws Exception;
	
	Map<String,Object> selectCafeRefund(Map<String,Object> map,HttpSession session) throws Exception;
	
	List<Map<String,Object>> selectCProfitDetail(Map<String,Object> map,HttpSession session) throws Exception;

}
