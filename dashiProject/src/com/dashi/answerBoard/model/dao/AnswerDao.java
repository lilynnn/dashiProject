package com.dashi.answerBoard.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	
	// Answer 등록
	public int insertAnswer(Connection conn , Answer a ){
	int result = 0;
	
	PreparedStatement pstmt = null;
	String sql = prop.getProperty("insertAnswer");
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, a.getMemId());
		pstmt.setString(2, a.getqTitle());
		pstmt.setString(3, a.getqContent());
		
		result = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	
	return result;
	
}

} 

