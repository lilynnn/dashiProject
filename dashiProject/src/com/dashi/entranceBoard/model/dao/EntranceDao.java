package com.dashi.entranceBoard.model.dao;

import static com.dashi.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dashi.common.model.vo.Attachment;
import com.dashi.common.model.vo.PageInfo;
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
	
	public ArrayList<Entrance> selectEntranceList(Connection conn){
		ArrayList<Entrance> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectEntranceList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Entrance(rset.getString("ent_no")
									, rset.getString("ent_title")
									, rset.getString("process_result")
									, rset.getString("titleimg")));		
						
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	} // 썸네일 리스트 조회해오기
	
	public ArrayList<Attachment> selectAttachmentList(Connection conn, String eno){
		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setAttachNo(rset.getString("attach_no"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				at.setPath(rset.getString("path"));
				
				list.add(at);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	} //첨부파일 여러개 조회해오기
	
	public Entrance selectEntrance(Connection conn, String eno) {
		// select=>ResultSet=>Board객체
		Entrance b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectEntrance");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Entrance(rset.getString("ENT_NO")
							   , rset.getString("MEM_NO")
							   , rset.getString("MEM_NAME")
							   , rset.getString("ENT_TITLE")
							   , rset.getDate("ENT_APPLYDATE")
							   , rset.getString("PROCESS_RESULT")
							   , rset.getString("ANIMAL_VARIETY")
							   , rset.getString("ANIMAL_NAME")
							   , rset.getString("ANIMAL_GENDER")
							   , rset.getInt("ANIMAL_AGE")
							   , rset.getString("ANIMAL_VACCINATED")
							   , rset.getString("ANIMAL_NEUTRALIZATION")
							   , rset.getString("ANIMAL_DISEASE")
							   , rset.getString("ANIMAL_ISSUE")
							   , rset.getDate("ENT_WANT_DATE")
							   , rset.getString("ENT_WANT_TIME")
							   , rset.getString("REQ_PHONE")
							   , rset.getString("ANIMAL_TYPE")
								);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}// 게시글 상세조회
	
	public int selectListCount(Connection conn){
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
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;		
		
	}// 게시글 총 갯수 조회해서 페이징바 만들기~
	
	public ArrayList<Entrance> selectList(Connection conn, PageInfo pi){
		
		ArrayList<Entrance> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Entrance(rset.getString("ent_no")
								    , rset.getString("mem_name")
								    , rset.getString("ent_title")
								    , rset.getDate("ent_applydate")
								    , rset.getString("process_result")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}// 일반게시판 각 페이지마다 보여지는 목록
	
	public int updateEntrance(Connection conn, Entrance e) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateEntrance");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, e.getMemName());
			pstmt.setString(2, e.getEntTitle());
			pstmt.setString(3, e.getAnimalVariety());
			pstmt.setString(4, e.getAnimalName());
			pstmt.setInt(5, e.getAnimalAge());
			pstmt.setString(6, e.getAnimalDisease());
			pstmt.setString(7, e.getAnimalIssue());
			pstmt.setDate(8, e.getEntWantDate());
			pstmt.setString(9, e.getEntWantTime());
			pstmt.setString(10, e.getReqPhone());
			pstmt.setString(11, e.getEntNo());
			
			result = pstmt.executeUpdate();			
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	} // 게시글 수정등록
	
	public int updateAttachment(Connection conn, ArrayList<Attachment> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
				
		try {
			
			int i = 0;
			
			for(Attachment at : list) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getPath());
				pstmt.setString(4, at.getAttachNo());				

				result = pstmt.executeUpdate();			
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}// 첨부파일 업데이트 (파일변경)
	
	public int insertNewAttachment(Connection conn, ArrayList<Attachment> list) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			for(Attachment at : list) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getRefNo());
				pstmt.setString(2, at.getOriginName());
				pstmt.setString(3, at.getChangeName());
				pstmt.setString(4, at.getPath());
				
			}
			
			result = pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	} // 첨부파일 등록
	
	public int deleteEntrance(Connection conn, String eno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteEntrance");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	} // 입소신청서 삭제
	
	public int deleteAttachment(Connection conn, String eno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	} // 첨부파일 삭제
	
	public int confirmEntrance(Connection conn, String eno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("confirmEntrance");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	} // 첨부파일 삭제
	
	public int rejectEntrance(Connection conn, String eno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("rejectEntrance");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	} // 첨부파일 삭제
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
