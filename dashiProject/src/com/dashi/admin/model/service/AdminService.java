package com.dashi.admin.model.service;

import java.sql.Connection;

import com.dashi.admin.model.dao.AdminDao;
import com.dashi.admin.model.vo.Manager;
import static com.dashi.common.JDBCTemplate.*;

public class AdminService {

	public Manager loginAdmin(String userId, String userPwd) {
		
		Connection conn = getConnection();
		
		Manager a = new AdminDao().loginAdmin(conn, userId, userPwd);
		
		close(conn);
		
		return a;
	}
	
	
	
}
