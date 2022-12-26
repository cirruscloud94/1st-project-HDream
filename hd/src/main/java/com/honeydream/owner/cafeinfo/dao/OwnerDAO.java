package com.honeydream.owner.cafeinfo.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("ownerDAO")
public class OwnerDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCafeInfoList(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>)selectList("owner.selectCafeList", map);
	}

	public void insertCafeinfoTable(Map<String, Object> map) throws Exception {
		
		insert("owner.insertCafeinfoTable", map);
		
	}

	public void insertFileOfCafeinfo(Map<String, Object> map) throws Exception {
		
		insert("owner.insertFileOfCafeinfo", map);
		
	}

	@SuppressWarnings("unchecked") //미확인 오퍼레이션과 관련된 경고를 억제한다.
	public Map<String, Object> selectCafeinfoDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("owner.selectCafeinfoDetail", map);
	}

	public void updateCafeinfo(Map<String, Object> map) throws Exception {
		update("owner.updateCafeinfo", map);
		
	}

	public void deleteCafeinfo(Map<String, Object> map) throws Exception {
		update("owner.deleteCafeinfo", map); //update문을 호출하는 이유는 게시글 삭제가 아닌 구분값(DEL_GB)를 변경하기 때문
		
	}
	
	public void deleteGoodsOfDeletedCafeinfo(Map<String, Object> map) throws Exception {
		update("deleteGoodsOfDeletedCafeinfo", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileListFromCafeinfo(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("owner.selectFileListFromCafeinfo", map);
	}

	public void deleteFileListOfCafeinfo(Map<String, Object> map) throws Exception {
		update("owner.deleteFileListOfCafeinfo", map);		
	}

	public void updateFileOfCafeinfo(Map<String, Object> map) throws Exception {
		update("owner.updateFileOfCafeinfo", map);
		
	}
	
	

}



















