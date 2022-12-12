package com.honeydream.user.reserv.service;

import java.util.Map;

public interface ReservService {
	
	Map<String, Object> reserv(Map<String, Object> map)
	throws Exception;
	
	Map<String, Object> selectReservTime(Map<String, Object> map)
	throws Exception;

}
