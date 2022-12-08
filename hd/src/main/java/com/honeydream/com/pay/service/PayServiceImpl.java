package com.honeydream.com.pay.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.com.pay.dao.PayDAO;

@Service("PayService")
public class PayServiceImpl implements PayService{
	
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="PayDAO")
	private PayDAO payDAO;
	
	@Override
	public Map<String, Object> payReserv(Map<String, Object> map)
	throws Exception {
		
		return payDAO.payReserv(map);
	}

}
