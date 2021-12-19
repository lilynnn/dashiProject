package com.dashi.answerBoard.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dashi.answerBoard.model.vo.Answer;

import static com.dashi.common.JDBCTemplate.*;

	//properties 연결 
	public class AnswerDao {
	
	private Properties prop = new Properties();

	String filePath = AnswerDao.class.getResource("/db/sql/answer-mapper.xml").getPath();

	public AnswerDao() {
		
	try {
		prop.loadFromXML(new FileInputStream(filePath));
	} catch (IOException e) {
		e.printStackTrace();
		}	
}
	
	
	// Answer 조회
	
	public ArrayList<Answer> selectAnswerList(Connection conn){
	
			ArrayList<Answer> list = new ArrayList<>();
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectAnswerList");
			
			try {
				pstmt = conn.prepareStatement(sql); 
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Answer(
										rset.getString("inquireNo"),
										rset.getInt("asCategory"),
										rset.getString("memId"),
										rset.getString("qTitle"),
										rset.getString("qContent"),
										rset.getDate("qCreat")));
					}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
	}
	
	
	// Answer 등록
	public int insertAnswer(Connection conn , Answer a){
	int result = 0;
	
	PreparedStatement pstmt = null;
	String sql = prop.getProperty("insertAnswer");
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, a.getasCategory());
		pstmt.setString(2, a.getMemId());
		pstmt.setString(3, a.getqTitle());
		pstmt.setString(4, a.getqContent());
		
	
		result = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	
	return result;
	
}
	// 관리자 adAnswer 등록
		public int adinsertAnswer(Connection conn , Answer a){
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adinsertAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a.getAnContent());
	
			
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
} 

