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
import com.dashi.faqBoard.model.vo.FAQ;

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
	
	// 1) answer 사용자 전체조회 
		public ArrayList<Answer> selectAnswerList(Connection conn){
		
		ArrayList<Answer> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAnswerList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();

			while(rset.next()) {
				Answer as = new Answer(rset.getString("inquire_no")
						   , rset.getInt("MEM_NO")
						   , rset.getString("Q_TITLE")
						   , rset.getString("Q_CONTENT")
						   , rset.getDate("Q_CREAT"));
				
				list.add(as);
				System.out.println(as);
			} 
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		}
		
	// 2) 사용자 answer 등록	
		public int insertAnswer(Connection conn, Answer a) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertAnswer");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, a.getqTitle());
				pstmt.setString(2, a.getqContent());
				pstmt.setInt(3, a.getMemNo());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
		}// 사용자 answer 등록
		
		
		
		public Answer selectDetailAnswer(Connection conn, String answerNo) {
			 
			Answer n = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectDetailAnswer");
			
			try {
				pstmt = conn.prepareStatement(sql);  
				
				pstmt.setString(1, answerNo);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					n = new Answer(rset.getString("inquire_no")
								   , rset.getInt("MEM_NO")
								   , rset.getString("Q_TITLE")
								   , rset.getString("Q_CONTENT")
								   , rset.getDate("Q_CREAT")
								   , rset.getInt("VIEW_COUNT"));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return n;
		}
		
		public int increaseCount(Connection conn, String answerNo) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("increaseCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, answerNo);
				
				result = pstmt.executeUpdate();			
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
		}// 조회수 증가
		
		
		//삭제
		public int deleteAnswer(Connection conn, String answerNo) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("deleteAnswer");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, answerNo);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
		
		} //삭제
		
		
		
		
		
}
	
	
		
	

