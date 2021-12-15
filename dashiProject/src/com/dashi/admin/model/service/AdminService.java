package com.dashi.admin.model.service;

import java.sql.Connection;

import com.dashi.admin.model.dao.AdminDao;
import com.dashi.admin.model.vo.Manager;
import static com.dashi.common.JDBCTemplate.*;

public class AdminService {

	public Manager loginAdmin(String mnId, String mnPwd) {
		
		Connection conn = getConnection();
		
		Manager a = new AdminDao().loginAdmin(conn, mnId, mnPwd);
				
		close(conn);
		
		return a;
	}// 관리자 로그인
	
	
	
}
