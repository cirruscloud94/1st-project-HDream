package com.honeydream.user.pay.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("PayDAO")
public class PayDAO extends AbstractDAO {
	@SuppressWarnings("unchecked")
	public Map<String, Object> payReserv(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("reserv.payReserv", map);
	}
}
