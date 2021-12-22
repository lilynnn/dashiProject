package com.dashi.entranceBoard.model.dao;

import static com.dashi.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dashi.common.model.vo.Attachment;
import com.dashi.entranceBoard.model.vo.Entrance;

public class EntranceDao {
	
	private Properties prop = new Properties();
	
	public EntranceDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(EntranceDao.class.getResource("/db/sql/entrance-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int insertEntrance(Connection conn, Entrance e) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertEntrance");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, e.getMemNo());
			pstmt.setString(2, e.getMemName());
			pstmt.setString(3, e.getEntTitle());
			pstmt.setString(4, e.getAnimalVariety());
			pstmt.setString(5, e.getAnimalName());
			pstmt.setString(6, e.getAnimalGender());
			pstmt.setInt(7, e.getAnimalAge());
			pstmt.setString(8, e.getAnimalVaccinated());
			pstmt.setString(9, e.getAnimalNeturalization());
			pstmt.setString(10, e.getAnimalDisease());
			pstmt.setString(11, e.getAnimalIssue());
			pstmt.setDate(12, e.getEntWantDate());
			pstmt.setString(13, e.getEntWantTime());
			pstmt.setString(14, e.getReqPhone());
			pstmt.setString(15, e.getAnimalType());
			
			result = pstmt.executeUpdate();		
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	} // 입소신청 등록
	
	public int insertAttachmentList(Connection conn, ArrayList<Attachment> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachmentList");
		
		try {
			
			for(Attachment at : list) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getPath());
				pstmt.setString(2, at.getOriginName());
				pstmt.setString(3, at.getChangeName());
				pstmt.setInt(4, at.getAttachLevel());
				
				result = pstmt.executeUpdate();
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	} // 첨부파일 게시판 등록
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
