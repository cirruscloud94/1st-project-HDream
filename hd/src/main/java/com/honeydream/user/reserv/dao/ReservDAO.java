package com.honeydream.user.reserv.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("reservDAO")
public class ReservDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> reserv(Map<String, Object> map) 
			throws Exception {
		
		return (Map<String, Object>) selectOne("reserv.selectOption", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectReservTime(Map<String, Object> map) 
			throws Exception {
		
		return (Map<String, Object>) selectOne("reserv.selectReservTime", map);
	}
}
