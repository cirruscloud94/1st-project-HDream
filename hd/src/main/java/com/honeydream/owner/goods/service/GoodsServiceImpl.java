package com.honeydream.owner.goods.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.honeydream.common.util.FileUtils;
import com.honeydream.owner.goods.dao.GoodsDAO;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="goodsDAO")
	private GoodsDAO goodsDAO;
	
	@Override
	public List<Map<String, Object>> selectGoodsList(Map<String, Object> map) throws Exception {
		
		return goodsDAO.selectGoodsList(map);
	}

	@Override
	public void insertOwnerGoodsRegTable(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		map.put("m_id", m_id);
		
		goodsDAO.selectCAFEIDX(map);
		int goodsReg_cafe_idx = (int)map.get("CAFE_IDX");
		map.put("GOODSREG_CAFE_IDX", goodsReg_cafe_idx);
		
		goodsDAO.insertOwnerGoodsRegTable(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++) {
			goodsDAO.insertFileOfGoodsReg(list.get(i));
		}
		

	}

}



























