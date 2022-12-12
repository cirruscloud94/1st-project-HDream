package com.honeydream.user.reserv.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.user.reserv.dao.ReservDAO;

@Service("reservService")
public class ReservServiceImpl implements ReservService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reservDAO")
	private ReservDAO reservDAO;
	
	@Override
	public Map<String, Object> reserv(Map<String, Object> map)
	throws Exception {
		
		return reservDAO.reserv(map);
	}
	
	@Override
	public Map<String, Object> selectReservTime(Map<String, Object> map)
	throws Exception {
		
		return reservDAO.selectReservTime(map);
	}
	
}
