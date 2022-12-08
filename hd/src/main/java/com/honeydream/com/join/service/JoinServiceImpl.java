package com.honeydream.com.join.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.com.join.dao.JoinDAO;

@Service("joinService")
public class JoinServiceImpl implements JoinService{
	Logger log = Logger.getLogger(this.getClass());
	
	//Resource 어노테이션을 사용하여 타입이 아닌 이름으로 해당 객체를 주입한다.
	@Resource(name = "joinDAO")
	private JoinDAO joinDAO;
	
	@Override
	public int insertMember(Map<String, Object> map) throws Exception{
		return joinDAO.insertMember(map);
	}
	
	@Override
	public Map<String, Object> getUserInfo(Map<String, Object> map) throws Exception{
		return joinDAO.getUserInfo(map);
	}
}