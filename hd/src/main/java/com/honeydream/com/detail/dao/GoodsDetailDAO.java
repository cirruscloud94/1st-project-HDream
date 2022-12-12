package com.honeydream.com.detail.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("goodsDetailDAO")//이 클래스가 DAO임을 선언
public class GoodsDetailDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGoodsInfo(Map<String, Object> map) throws Exception {// 메서드가 생성되었다
		return (Map<String, Object>)selectOne("detail.selectGoodsInfo", map);// MyBatis의 기본기능, 리스트 조회시 사용
		// 그리고 그 결과값은 List<Map<String,Object>> 형식으로 반환할 수 있도록 형변환을 하였다
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPrice(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("detail.selectPrice", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectContents(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("detail.selectContents", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReview(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("detail.selectReview", map);
	}
	
}