package com.honeydream.user.mypage.reserv.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface ReservService {
	
	Map<String,Object> selectReservList(Map<String,Object> map,HttpSession session) throws Exception;
	
	void cancelReserv(Map<String,Object> map) throws Exception;

	void updateRefund(Map<String,Object> map) throws Exception;

}
