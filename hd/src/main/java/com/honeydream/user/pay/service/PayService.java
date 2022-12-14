package com.honeydream.user.pay.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

public interface PayService {
	
	public Map<String, Object> payReserv(Map<String, Object> map) throws Exception;
	
	//회원정보 출력
	public Map<String,Object> selectUserInfo(Map<String, Object> map, HttpSession session) throws Exception;
	
	//카페정보 출력
	public Map<String,Object> selectCafeInfo(Map<String, Object> map) throws Exception;
	
	//상품정보 출력
	public Map<String,Object> selectGoodsInfo(Map<String, Object> map) throws Exception;
	
	//결제 후 예약정보 삽입
	public void insertReserv(Map<String, Object> map) throws Exception;
}
