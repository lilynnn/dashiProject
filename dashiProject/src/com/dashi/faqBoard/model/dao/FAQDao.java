package com.dashi.faqBoard.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.dashi.common.JDBCTemplate.*;

import com.dashi.faqBoard.model.vo.FAQ;

public class FAQDao {
	
	private Properties prop = new Properties();
	
	public FAQDao() {
			
		try {
			prop.loadFromXML(new FileInputStream(FAQDao.class.getResource("/db/sql/faq-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}

	} //프로퍼티스 파일 연결 
	
	public ArrayList<FAQ> selectFAQList(Connection conn){
		
		ArrayList<FAQ> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFAQList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new FAQ(rset.getString("faq_no")
							   , rset.getString("faq_title")
							   , rset.getString("faq_content")
							   , rset.getDate("faq_enroll_date")
							   , rset.getDate("faq_modify_date")
							   , rset.getString("faq_status")
							   , rset.getInt("mn_no")
							   , rset.getInt("faq_category")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	} // faq조회
	
	public int insertFAQ(Connection conn, FAQ f) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getFAQTitle());
			pstmt.setString(2, f.getFAQContent());
			pstmt.setInt(3, f.getMnNo());
			pstmt.setInt(4, f.getFAQCategory());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}// faq등록
	
	public int deleteFAQ(Connection conn, String faqNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, faqNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}// faq 삭제
	
	public FAQ selectFAQ(Connection conn, String fNo){
		
		FAQ f = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFAQ");
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				f = new FAQ(rset.getString("faq_no")
						  , rset.getString("faq_title")
						  , rset.getString("faq_content")
						  , rset.getInt("faq_category"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return f;

	} //faq하나 조회
	
	public int updateFAQ(Connection conn, FAQ f) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getFAQTitle());
			pstmt.setString(2, f.getFAQContent());
			pstmt.setInt(3, f.getFAQCategory());
			pstmt.setString(4, f.getFAQNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}// faq 수정
	
	public ArrayList<FAQ> keywordFAQ(Connection conn, String keyword){
		
		ArrayList<FAQ> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("keywordFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new FAQ(rset.getString("faq_no")
							   	  , rset.getString("faq_title")
							      , rset.getString("faq_content")
							      , rset.getInt("faq_category")));
			}		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	} // faq keyword
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
