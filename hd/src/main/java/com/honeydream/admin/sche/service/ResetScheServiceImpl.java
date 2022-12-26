package com.honeydream.admin.sche.service;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.admin.sche.dao.ResetScheDAO;

@Service("resetScheService")
public class ResetScheServiceImpl implements ResetScheService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="resetScheDAO")
	private ResetScheDAO resetScheDAO;
	
	@Override
	public void resetSche(Map<String, Object> map) throws Exception {
		resetScheDAO.updateSche(map);
	}
}