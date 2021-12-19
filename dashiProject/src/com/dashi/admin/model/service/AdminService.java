package com.dashi.admin.model.service;

import static com.dashi.common.JDBCTemplate.*;
import static com.dashi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.dashi.admin.model.dao.AdminDao;
import com.dashi.admin.model.vo.Manager;
import com.dashi.common.model.vo.PageInfo;

public class AdminService {

	public Manager loginAdmin(String mnId, String mnPwd) {
		
		Connection conn = getConnection();
		
		Manager a = new AdminDao().loginAdmin(conn, mnId, mnPwd);
				
		close(conn);
		
		return a;
	}// 관리자 로그인

	public ArrayList<Manager> selectAdminList(){
		Connection conn = getConnection();
		ArrayList<Manager> list = new AdminDao().selectAdminList(conn);
		
		close(conn);
		return list;		
		
	} // 모든 사원 조회
	
	public int insertAdmin(Manager a) {
		Connection conn = getConnection();
		int result = new AdminDao().insertAdmin(conn, a);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	} // 관리자 등록
	
	public Manager selectAdmin(int ano){
		Connection conn = getConnection();
		Manager a = new AdminDao().selectAdmin(conn, ano);
		close(conn);
		return a;		
		
	} //  사원 조회
	
	public int updateAdmin(Manager a) {
		Connection conn = getConnection();
		int result = new AdminDao().insertAdmin(conn, a);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	} // 사원 수정 & 탈퇴
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
