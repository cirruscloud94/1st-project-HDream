package com.honeydream.com.detail.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.com.detail.dao.GoodsDetailDAO;

@Service("goodsDetailService")//어노테이션으로 reservService가 서비스 객체임을 선언
public class GoodsDetailServiceImpl implements GoodsDetailService{
	
	Logger log = Logger.getLogger(this.getClass());//서비스 영역이 실행해야 할 로직 실행( 이클래스)
	
	@Resource(name="goodsDetailDAO")//bean을 수동적으로 등록
	private GoodsDetailDAO goodsDetailDAO;//Service에서 데이터 접근을 위한 DAO 객체 선언

	@Override
	public Map<String, Object> selectGoodsInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return goodsDetailDAO.selectGoodsInfo(map);
	}//인터페이스를 통한 메서드 실제 구현(서비스의 메소드 꼭 구현해야함) 
	
	@Override
	public List<Map<String, Object>> selectPrice(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return goodsDetailDAO.selectPrice(map);
	}
	
	@Override
	public Map<String, Object> selectContents(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return goodsDetailDAO.selectContents(map);
	}
	
	 
	

}
