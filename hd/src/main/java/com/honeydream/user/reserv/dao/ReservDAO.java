package com.honeydream.user.reserv.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("ReservDAO")
public class ReservDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectReserv(
			Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne(
				"reserv.selectReserv", map);
	}
}
