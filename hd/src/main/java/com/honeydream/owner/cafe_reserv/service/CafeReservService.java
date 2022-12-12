package com.honeydream.owner.cafe_reserv.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface CafeReservService {
	
	List<Map<String,Object>> selectCafeReservList(Map<String,Object> map,HttpSession session) throws Exception;
	
	void updateStatus(Map<String,Object> map) throws Exception;

}