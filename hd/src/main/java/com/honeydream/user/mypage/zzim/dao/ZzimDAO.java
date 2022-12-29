package com.honeydream.user.mypage.zzim.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("zzimDAO")
public class ZzimDAO extends AbstractDAO{
	//찜한 카페리스트 가져오기
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectZzim(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectPagingList("user.selectZzim",map);
	}
	
	public void deleteZzim(Map<String, Object> map) throws Exception {
        delete("common.deleteZzim", map);
    }
}