package com.honeydream.user.mypage.zzim.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.user.mypage.zzim.dao.ZzimDAO;

@Service("zzimService")
public class ZzimServiceImpl implements ZzimService {
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "zzimDAO")
	private ZzimDAO zzimDAO;
	
	@Override
	public Map<String, Object> selectZzim(Map<String, Object> map, HttpSession session) throws Exception {
		String m_id = (String)session.getAttribute("m_id"); //로그인 아이디가져오기
		map.put("m_id", m_id);
		return zzimDAO.selectZzim(map);
	}
	
    @Override
    public void deleteZzim(Map<String, Object> map, HttpSession session) throws Exception {
        String m_id = (String)session.getAttribute("m_id"); //로그인 아이디가져오기
        map.put("m_id", m_id);
        zzimDAO.deleteZzim(map);
    } 

}
