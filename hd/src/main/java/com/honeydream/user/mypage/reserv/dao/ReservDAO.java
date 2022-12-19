package com.honeydream.user.mypage.reserv.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("userReservDAO")
public class ReservDAO extends AbstractDAO{
	
	//마이페이지에서 자신의 예약 목록을 확인
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectReservist(Map<String,Object> map) throws Exception {
		return (List<Map<String,Object>>)selectList("user.selectReservList",map);
	}
	
	//마이페이지에서 자신의 예약을 취소
	public void cancelReserv(Map<String,Object> map) throws Exception {
		update("user.cancelReserv",map);
	}
	
	
	

}
