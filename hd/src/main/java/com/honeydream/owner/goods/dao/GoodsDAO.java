package com.honeydream.owner.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("goodsDAO")
public class GoodsDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGoodsList(Map<String, Object> map) throws Exception {
		
			return (List<Map<String,Object>>)selectList("goods.selectGoodsList", map);
	}

	public void insertOwnerGoodsRegTable(Map<String, Object> map) {
		
		insert("goods.insertOwnerGoodsRegTable", map);
		
	}
	
	public void insertFileOfGoodsReg(Map<String, Object> map) throws Exception {
		insert("goods.insertFileOfGoodsReg", map);
	}



}
