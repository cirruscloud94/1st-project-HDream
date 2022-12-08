package com.honeydream.user.mypage.user_info.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("userInfoDAO")
public class UserInfoDAO extends AbstractDAO {
	
	//마이페이지에서 자기정보 조회
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectUserInfo(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("user.selectUserInfo",map);
	}
	//회원탈퇴
	public void deleteUser(Map<String, Object> map) throws Exception {
			update("user.deleteUser",map);
	}
	
	//회원이 자기정보 수정
	public void updateUserInfo(Map<String, Object> map) throws Exception {
		update("user.updateUserInfo",map);
	}
	
	

}
