package com.dashi.animalListBoard.model.dao;

import static com.dashi.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dashi.adoptBoard.model.dao.AdoptBoardDao;
import com.dashi.adoptBoard.model.vo.AdoptNotice;
import com.dashi.animalListBoard.model.vo.Animal;
import com.dashi.common.model.vo.PageInfo;

public class AnimalListDao {

	private Properties prop = new Properties();
	
	public AnimalListDao() {
		try {
			prop.loadFromXML(new FileInputStream(AdoptBoardDao.class.getResource("/db/sql/animal-mapper.xml").getPath()));
			
			
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

	public ArrayList<Animal> selectList(Connection conn, PageInfo pi){
		
		// select -> ResultSet -> ArrayList<Animal>
		ArrayList<Animal> list = new ArrayList<Animal>();
		
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
				
				list.add(new Animal(rset.getString("ENT_NO"),
									rset.getString("ADOPT_STATUS"),
									rset.getString("ANIMAL_VARIETY"),
									rset.getString("ANIMAL_NAME"),
									rset.getString("ANIMAL_TYPE"),
									rset.getString("ENT_DATE")
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
}
