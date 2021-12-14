package com.dashi.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.dashi.common.JDBCTemplate.*;

import com.dashi.member.model.vo.Member;

public class MemberDao {
	private Properties prop = new Properties();

	public MemberDao() {
		
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection conn, String userId, String userPwd) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("mem_no"),
							   rset.getString("mem_Id"),
							   rset.getString("mem_pwd"),
							   rset.getString("mem_Name"),
							   rset.getString("nickname"),
							   rset.getDate("dob"),
							   rset.getString("gender"),
							   rset.getString("email"),
							   rset.getString("post_no"),
							   rset.getString("address"),
							   rset.getString("address_d"),
							   rset.getString("phone"),
							   rset.getDate("enroll_date"),
							   rset.getString("adopt_YN"),
							   rset.getString("enter_YN"),
							   rset.getString("pay_YN"),
							   rset.getString("delete_YN"),
							   rset.getString("del_reason"),
							   rset.getDate("del_date"),
							   rset.getString("blackList_YN"),
							   rset.getString("black_reason"),
							   rset.getDate("black_date"),
							   rset.getInt("grade"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

}
