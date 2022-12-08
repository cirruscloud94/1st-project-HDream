package com.honeydream.owner.cafe_reserv.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("cafeReservDAO")
public class CafeReservDAO extends AbstractDAO{
	
	
	//사장님이 예약현황을 확인
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectCafeReservist(Map<String,Object> map) throws Exception {
		return (List<Map<String,Object>>)selectList("owner.selectCafeReservList",map);
	}
	
	//사장님이 예약현황을 수정
	public void updateStatus(Map<String,Object> map) throws Exception {
		update("owner.updateStatus",map);
	}
	

}
