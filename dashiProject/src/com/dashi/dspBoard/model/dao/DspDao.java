package com.dashi.dspBoard.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.dashi.common.JDBCTemplate.*;

import com.dashi.common.model.vo.Attachment;
import com.dashi.dspBoard.model.vo.Dsp;

public class DspDao {
	
	private Properties prop = new Properties();

	public int insertDsp(Connection conn, Dsp d) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertDsp");
		

		
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(d.getMemNo()));
			pstmt.setString(2, d.getDspTitle());
			pstmt.setString(3, d.getNickName());
			pstmt.setString(4, d.getCtg());
			pstmt.setString(5, d.getIssueDate());
			pstmt.setString(6, d.getLocationName());
			pstmt.setString(7, d.getPhone());
			pstmt.setString(8, d.getVariety());
			pstmt.setString(9, d.getGender());
			pstmt.setString(10, d.getAge());
			pstmt.setString(11, d.getWeight());
			pstmt.setString(12, d.getIssue());
			pstmt.setString(13, d.getEtc());
			
			result = pstmt.executeUpdate();
			

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertDspAttachment(Connection conn, ArrayList<Attachment> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertDspAttachment");
		
		try {
			for(Attachment at : list) {
				pstmt =conn.prepareStatement(sql);
			
				pstmt.setString(1, at.getPath());
				pstmt.setString(2, at.getOriginName());
				pstmt.setString(3, at.getChangeName());
				pstmt.setInt(4, at.getAttachLevel());
				
				result=pstmt.executeUpdate();
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	
	}

}
