package com.dashi.admin.model.dao;

import static com.dashi.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dashi.admin.model.vo.Manager;
import com.dashi.common.model.vo.PageInfo;

public class AdminDao {

	private Properties prop = new Properties();
		
		public AdminDao() {
			
			try {
				prop.loadFromXML(new FileInputStream(AdminDao.class.getResource("/db/sql/admin-mapper.xml").getPath()));
			} catch (IOException e) {
				e.printStackTrace();
			}
	
		} //프로퍼티스 파일 연결 
	
		public Manager loginAdmin(Connection conn, String mnId, String mnPwd) {
			// select문 => ResultSet객체(한 행) => Member객체
			Manager a = null;
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("loginAdmin");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, mnId);
				pstmt.setString(2, mnPwd);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					a = new Manager(rset.getInt("MN_NO")
								 , rset.getString("MN_ID")
								 , rset.getString("MN_PWD")
								 , rset.getString("MN_NICKNAME")
								 , rset.getString("MN_NAME")
								 , rset.getString("MN_EMAIL")
								 , rset.getString("MN_PHONE")
								 , rset.getDate("MN_JOIN")
								 , rset.getString("MN_QUIT")
								 , rset.getString("ACTIVATION"));
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			return a;
			
		} // 관리자 로그인
		
		public ArrayList<Manager> selectAdminList(Connection conn){
			// select문 => ResultSet(여러 행) => ArrayList<Board>
			ArrayList<Manager> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Manager(rset.getInt("mn_no")
									   , rset.getString("mn_id")
									   , rset.getString("mn_pwd")
									   , rset.getString("mn_nickname")
									   , rset.getString("mn_name")
									   , rset.getString("mn_email")
									   , rset.getString("mn_phone")
									   , rset.getDate("mn_join")
									   , rset.getString("mn_quit")
									   , rset.getString("activation")));
				}	
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
					
		} // 전체 사원 조회
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	
}
