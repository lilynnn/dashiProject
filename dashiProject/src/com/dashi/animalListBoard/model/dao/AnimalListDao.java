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
	
	// 수정하고 확인하기
	public Attachment selectAttachment(Connection conn, String animalNo) {
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, animalNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				at.setAttachNo(rset.getString("ATTACH_NO"));
				at.setRefNo(rset.getString("REF_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setPath(rset.getString("PATH"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
	}
	
	public ArrayList<Attachment> selectAttachmentList(Connection conn, String animalNo){
		ArrayList<Attachment> list = new ArrayList<Attachment>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, animalNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setPath(rset.getString("PATH"));
				at.setAttachLevel(rset.getInt("ATTACH_LEVEL"));
				
				list.add(at);
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
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// entrance테이블에 동물정보 update
	public int updateAnimalInfo2(Connection conn, Animal a) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAnimalInfo2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a.getAnimalAge());
			pstmt.setString(2, a.getAnimalVaccin());
			pstmt.setString(3, a.getAnimalNeutral());
			pstmt.setString(4, a.getAnimalDisease());
			pstmt.setString(5, a.getAnimalIssue());
			pstmt.setString(6, a.getEntNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 첨부파일이 존재할 때 update하는 메소드
	public int updateAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getPath());
			pstmt.setInt(4, at.getAttachLevel());
			pstmt.setString(5, at.getAttachNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 첨부파일이 존재하지 않을 때 insert하는 메소드
	public int insertAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getRefNo());
			pstmt.setString(2, at.getPath());
			pstmt.setString(3, at.getOriginName());
			pstmt.setString(4, at.getChangeName());
			pstmt.setInt(5, at.getAttachLevel());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}
