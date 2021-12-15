package com.dashi.adoptReviewBoard.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.dashi.common.JDBCTemplate.close;

import com.dashi.adoptReviewBoard.model.vo.AdoptReview;
import com.dashi.common.model.vo.Attachment;

public class AdoptReviewBoardDao {
	private Properties prop = new Properties();
	
	public AdoptReviewBoardDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(AdoptReviewBoardDao.class.getResource("/db/sql/adoptreview-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int insertThAdoptReviewBoard(Connection conn, AdoptReview ar) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertThAdoptReviewBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, ar.getMemNo());
			pstmt.setString(2, ar.getNickname());
			pstmt.setString(3, ar.getArTitle());
			pstmt.setString(4, ar.getArContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertReviewAttachmentList(Connection conn, ArrayList<Attachment> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReviewAttachmentList");
		
		try {
			
			for(Attachment at : list) {
				// 미완성된 sql문 담은 pstmt 생성
				pstmt = conn.prepareStatement(sql);
				
				// 완성된 형태로
				pstmt.setString(1, at.getPath());
				pstmt.setString(2, at.getOriginName());
				pstmt.setString(3, at.getChangeName());
				pstmt.setInt(4, at.getAttachLevel());
				
				// 실행
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}




