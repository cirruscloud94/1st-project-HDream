package com.honeydream.owner.downloadFile.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("downloadFileDAO")
public class downloadFileDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFileInfoFromCafeinfo(Map<String, Object> map) {
		return (Map<String, Object>)selectOne("downloadFile.selectFileInfoFromCafeinfo", map);
 	}

}
