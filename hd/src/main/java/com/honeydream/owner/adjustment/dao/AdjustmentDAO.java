package com.honeydream.owner.adjustment.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("adjustmentDAO")
public class AdjustmentDAO extends AbstractDAO{
	
	//결제수익을 확인
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectCafeProfit(Map<String,Object> map) throws Exception {
		return (Map<String,Object>)selectOne("owner.selectCafeProfit",map);
	}
	
	//환불금액을 확인
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectCafeRefund(Map<String,Object> map) throws Exception {
		return (Map<String,Object>)selectOne("owner.selectCafeRefund",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectCProfitDetail(Map<String,Object> map) throws Exception {
		return (List<Map<String,Object>>)selectList("owner.selectCProfitDetail",map);
	}
	
}

	
	


