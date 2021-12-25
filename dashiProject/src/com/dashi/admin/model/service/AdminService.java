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
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new AdminDao().selectListCount(conn);
		close(conn);
		return listCount;
	} // 관리자 총 명수	

	public ArrayList<Manager> selectAdminList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Manager> list = new AdminDao().selectAdminList(conn, pi);
		
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
		int result = new AdminDao().updateAdmin(conn, a);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	} // 사원 수정 
	
	public ArrayList<Manager> searchAdmin(String name){
		Connection conn = getConnection();
		ArrayList<Manager> list = new AdminDao().searchAdmin(conn, name);
		close(conn);
		return list;		
		
	} // 이름으로 조회
	
	public int deleteAdmin(int anum) {
		Connection conn = getConnection();
		int result = new AdminDao().deleteAdmin(conn, anum);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	} // 사원 퇴사
	
	public String findId(String adname, String adphone) {
		Connection conn = getConnection();
		String findId = new AdminDao().findId(conn, adname, adphone);
		close(conn);
		return findId;
	} // 관리자 아이디 조회
	
	public String findAdPwd(String adid, String adPwdphone) {
		Connection conn = getConnection();
		String findPwd = new AdminDao().findAdPwd(conn, adid, adPwdphone);
		close(conn);
		return findPwd;
	} // 관리자 비밀번호 조회
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
