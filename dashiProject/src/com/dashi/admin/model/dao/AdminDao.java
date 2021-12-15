package com.dashi.admin.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.dashi.admin.model.vo.Manager;
import com.dashi.member.model.vo.Member;
import com.dashi.notice.model.dao.NoticeDao;
import static com.dashi.common.JDBCTemplate.*;

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
								 , rset.getDate("MN_QUIT")
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
	
	
	
	
}
