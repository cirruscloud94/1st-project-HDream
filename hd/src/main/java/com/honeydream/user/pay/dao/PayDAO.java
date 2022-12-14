package com.honeydream.user.pay.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("payDAO")
public class PayDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> payReserv(Map<String, Object> map) 
			throws Exception {
		
		return (Map<String, Object>) selectOne("reserv.payReserv", map);
	}
	
	//결제 전 회원 정보 출력
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectUserInfo(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("user.selectUserInfo",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectCafeInfo(Map<String, Object> map) throws Exception {		
		return (Map<String, Object>) selectOne("common.selectCafeInfo",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectGoodsInfo(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("common.selectGoodsInfo",map);
	}
	
	public void insertReserv(Map<String, Object> map) throws Exception {
		insert("common.insertReserv",map);
	}
	
}
