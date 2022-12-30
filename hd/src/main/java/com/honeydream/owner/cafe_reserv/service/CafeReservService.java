package com.honeydream.owner.cafe_reserv.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

public interface CafeReservService {
	Map<String,Object> selectCafeReservList(Map<String,Object> map,HttpSession session) throws Exception;
	
	void updateStatus(Map<String,Object> map) throws Exception;
	
	Map<String,Object> checkStatus(Map<String,Object> map) throws Exception;
}