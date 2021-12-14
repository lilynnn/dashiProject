package com.dashi.adoptBoard.model.dao;

import static com.dashi.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dashi.adoptBoard.model.vo.AdoptNotice;
import com.dashi.common.model.vo.PageInfo;

public class AdoptBoardDao {
	
	private Properties prop = new Properties();
			
	public AdoptBoardDao() {
		try {
			prop.loadFromXML(new FileInputStream(AdoptBoardDao.class.getResource("/db/sql/adoptnotice-mapper.xml").getPath()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null; 
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	public ArrayList<AdoptNotice> selectList(Connection conn, PageInfo pi){
		
		// select -> ResultSet -> ArrayList<AdoptNotice>
		
		ArrayList<AdoptNotice> list = new ArrayList<AdoptNotice>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new AdoptNotice(rset.getString("ANLIST_NO")
										,rset.getString("AN_TITLE")
										,rset.getString("WRITE_DATE")
										,rset.getInt("VIEW_COUNT")
										,rset.getString("ENT_NO")
										,rset.getInt("ADT_STATUS")
										,rset.getString("ANIMAL_TYPE")
										));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int increaseCount(Connection conn, String boardNo) {
		// controller에서 커밋하기
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardNo);
			
			result = pstmt.executeUpdate();
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public AdoptNotice selectAdoptNotice(Connection conn, String boardNo) {
		
		AdoptNotice an = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAdoptNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				an = new AdoptNotice(rset.getString("ANLIST_NO")
						,rset.getString("AN_TITLE")
						,rset.getString("AN_CONTENT")
						,rset.getString("WRITE_DATE")
						,rset.getInt("VIEW_COUNT")
						,rset.getString("ENT_NO")
						,rset.getString("ANIMAL_VARIETY")
						,rset.getString("ANIMAL_NAME")
						,rset.getString("ANIMAL_GENDER")
						,rset.getInt("ANIMAL_AGE")
						,rset.getString("ANIMAL_VACCINATED")	
						,rset.getString("ANIMAL_NEUTRALIZATION")
						,rset.getString("ANIMAL_DISEASE")
						,rset.getString("ANIMAL_ISSUE")
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return an;
	}
	
	
	
	
}