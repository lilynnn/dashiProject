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
import com.dashi.animalListBoard.model.vo.Animal;
import com.dashi.common.model.vo.Attachment;
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
	
	public Animal selectAnimalInfo(Connection conn, String animalNo) {
		
		Animal a = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAnimalInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, animalNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				a = new Animal(rset.getString("ENT_NO"),
							   rset.getString("ADOPT_STATUS"),
							   rset.getString("ADOPT_DATE"),
							   rset.getString("ANIMAL_VARIETY"),
							   rset.getString("ANIMAL_NAME"),
							   rset.getString("ANIMAL_GENDER"),
							   rset.getInt("ANIMAL_AGE"),
							   rset.getString("ANIMAL_VACCINATED"),
							   rset.getString("ANIMAL_NEUTRALIZATION"),
							   rset.getString("ANIMAL_DISEASE"),
							   rset.getString("ANIMAL_ISSUE"),
							   rset.getString("ENT_DATE")
							   );
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return a;
	}
	
	/////////////////////////////////////////////////////////////////////////수정하기 수정수정!!!!!
	// 동물정보 update하고 나서 나중에 동물정보조회했을 때 동물 사진 보여지게 하는 메소드
	public Attachment selectAttachment(Connection conn, String animalNo) {
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, animalNo);
			
			rset = pstmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return at;
	}
	
	// 동물정보 update할 메소드
	public int updateAnimalInfo1(Connection conn, Animal a) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAnimalInfo1");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a.getAdoptStatus());
			pstmt.setString(2, a.getAdoptDate());
			pstmt.setString(3, a.getEntNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
