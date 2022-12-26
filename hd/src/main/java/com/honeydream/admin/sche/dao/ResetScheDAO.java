package com.honeydream.admin.sche.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.honeydream.common.dao.AbstractDAO;

@Repository("resetScheDAO")
public class ResetScheDAO  extends AbstractDAO {
	public void updateSche(Map<String, Object> map) throws Exception{
		update("common.start_proc_reset_sche", map).toString();
	}
}