package com.honeydream.owner.cafe_reserv.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("cafeReservDAO")
public class CafeReservDAO extends AbstractDAO{
	//사장님이 예약현황을 확인
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectCafeReservist(Map<String,Object> map) throws Exception {
		return (Map<String,Object>)selectPagingList("owner.selectCafeReservList",map);
	}
	
	//사장님이 예약현황을 수정
	public void updateStatus(Map<String,Object> map) throws Exception {
		update("owner.updateStatus",map);
	}
	
	//현재 예약상태를 체크
	@SuppressWarnings("unchecked")
	public Map<String,Object> checkStatus(Map<String,Object> map) throws Exception {
		return (Map<String,Object>)selectOne("owner.checkStatus",map);
	}
}