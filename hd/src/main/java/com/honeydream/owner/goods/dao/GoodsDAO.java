package com.honeydream.owner.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("goodsDAO")
public class GoodsDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGoodsList(Map<String, Object> map) throws Exception {
		
			return (Map<String,Object>)selectPagingList("goods.selectGoodsList", map);
	}

	public void insertOwnerGoodsRegTable(Map<String, Object> map) {
		
		insert("goods.insertOwnerGoodsRegTable", map);
		
	}
	
	public void insertFileOfGoodsReg(Map<String, Object> map) throws Exception {
		insert("goods.insertFileOfGoodsReg", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectCAFEIDX(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("goods.selectCAFEIDX", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGoodsDetail(Map<String, Object> map) throws Exception{
		
		return (Map<String, Object>) selectOne("goods.selectGoodsDetail", map);
	}

	public void updateGoods(Map<String, Object> map) throws Exception {
		
		update("goods.updateGoods", map);
		
	}

	public void deleteGoods(Map<String, Object> map) throws Exception {
		
		update("goods.deleteGoods", map);
		
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileListFromGoodsreg(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("goods.selectFileListFromGoodsreg", map);
	}

	public void deleteFileListOfGoodsreg(Map<String, Object> map) throws Exception {
		update("goods.deleteFileListOfGoodsreg", map);
		
	}

	public void updateFileOfGoodsreg(Map<String, Object> map) throws Exception {
		update("goods.updateFileOfGoodsreg", map);
		
	}



}























