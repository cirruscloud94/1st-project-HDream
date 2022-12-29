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
	public Map<String, Object> selectGoodsList(Map<String, Object> map, HttpSession session) throws Exception {
		
		String m_id = (String)session.getAttribute("m_id");
		map.put("m_id", m_id);
		
		return goodsDAO.selectGoodsList(map);
	}

	@Override
	public void insertOwnerGoodsRegTable(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		map.put("m_id", m_id);
	
	
		int goodsReg_cafe_idx = Integer.parseInt(goodsDAO.selectCAFEIDX(map).get("CAFE_IDX").toString());
		map.put("GOODSREG_CAFE_IDX", goodsReg_cafe_idx);
		
		goodsDAO.insertOwnerGoodsRegTable(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++) {
			goodsDAO.insertFileOfGoodsReg(list.get(i));
		}
		

	}

	@Override
	public Map<String, Object> selectGoodsDetail(Map<String, Object> map, HttpSession session) throws Exception {
		
		Map<String, Object> resultMap = goodsDAO.selectGoodsDetail(map);
		
		String m_id = (String)session.getAttribute("m_id");
		resultMap.put("m_id", m_id);
		
		String usetime = resultMap.get("GOODSREG_USETIME").toString();
		String usetime2 = (String)(usetime + "분");
		resultMap.put("usetime2", usetime2);
		
		String people = resultMap.get("GOODSREG_PEOPLE").toString();
		String people2 = (String)(people + "명");
		resultMap.put("people2", people2);
		
		String price = resultMap.get("GOODSREG_PRICE").toString();
		String price2 = (String)(price + "원");
		resultMap.put("price2", price2);
		
		List<Map<String, Object>> list = goodsDAO.selectFileListFromGoodsreg(map);
		resultMap.put("list", list);
				
		
		return resultMap;
	}

	@Override
	public void updateGoods(Map<String, Object> map, HttpServletRequest request) throws Exception {

		goodsDAO.updateGoods(map);
		
		goodsDAO.deleteFileListOfGoodsreg(map);
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo(map, request);
		Map<String, Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				goodsDAO.insertFileOfGoodsReg(tempMap);
			} else {
				goodsDAO.updateFileOfGoodsreg(tempMap);
			}
		}
	}

	@Override
	public void deleteGoods(Map<String, Object> map) throws Exception {
		
		goodsDAO.deleteGoods(map);
		
	}



}



























