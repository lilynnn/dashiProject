package com.dashi.dspBoard.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.dashi.common.JDBCTemplate.*;

import com.dashi.common.model.vo.Attachment;
import com.dashi.dspBoard.model.vo.Category;
import com.dashi.dspBoard.model.vo.Dsp;

public class DspDao {
	
	private Properties prop = new Properties();

	public DspDao() {
		try {
			prop.loadFromXML(new FileInputStream(DspDao.class.getResource("/db/sql/dsp-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int insertDsp(Connection conn, Dsp d) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertDsp");
	
		

		
		try {
			pstmt = conn.prepareStatement(sql);
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
			pstmt.setInt(14, d.getMoney());
			
			result = pstmt.executeUpdate();
			

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//첨부파일 입력 메소드
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

	//목록 리스트 메소드
	public ArrayList<Dsp> selectDspList(Connection conn) {

		//여러행 조회되니까 리스트 이용
		ArrayList<Dsp> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDspList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Dsp(rset.getString("dsp_no")
								,rset.getString("post_ctg")
								,rset.getString("dsp_title")
								,rset.getInt("money")
								,rset.getString("location_name")
								,rset.getString("animal_issue")
								,rset.getString("titleImg")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

	// 조회수 증가 메소드
	public int increaseCount(Connection conn, String dspNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dspNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	// 상세조회 시 정보 가져오는 메소드
	public Dsp selectDsp(Connection conn, String dspNo) {
		
		Dsp d = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	
		String sql = prop.getProperty("selectDsp");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dspNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				d = new Dsp(rset.getString("DSP_NO"),
							rset.getString("NICKNAME"),
							rset.getString("DSP_TITLE"),
							rset.getDate("WRITE_DATE"),
							rset.getInt("VIEW_COUNT"),
							rset.getString("POST_CTG"),			   
							rset.getString("ISSUE_DATE"),
							rset.getString("LOCATION_NAME"),
							rset.getString("CASE_PHONE"),
							rset.getString("ANIMAL_VARIETY"),
							rset.getString("ANIMAL_GENDER"),
							rset.getString("ANIMAL_AGE"),
							rset.getString("ANIMAL_WEIGHT"),
							rset.getString("ANIMAL_ISSUE"),
							rset.getString("ETC"),
							rset.getInt("MONEY"),
							rset.getString("TITLEIMG"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return d;
	}


	// 상세조회 시 첨부파일 가져오는 메소드
	public ArrayList<Attachment> selectAttachmentList(Connection conn, String dspNo) {
		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dspNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) { // 커서 움직이면서 필요한거 뽑기
				Attachment at = new Attachment();
				at.setChangeName(rset.getString("change_name"));
				at.setPath(rset.getString("path"));
				
				list.add(at);
	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	// 실종 보호 목격 글 누르면 그에 맞는 목록이 보이는 메소드
	public ArrayList<Dsp> ctgList(Connection conn, String ctg) {
		ArrayList<Dsp> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("ctgList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, ctg);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Dsp(rset.getString("dsp_no")
								,rset.getString("post_ctg")
								,rset.getString("dsp_title")
								,rset.getInt("money")
								,rset.getString("location_name")
								,rset.getString("animal_issue")
								,rset.getString("titleImg")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	public ArrayList<Category> selectCategoryList(Connection conn) {
		ArrayList<Category> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null; //조회할때 필수요소
		String sql = prop.getProperty("selectCategoryList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Category(rset.getString("category_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 상세이미지 경 뽑아줄것
	public ArrayList<Dsp> contentImgPath(Connection conn, String dspNo) {
		
		ArrayList<Dsp> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("contentImgPath");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dspNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) { 
				list.add(new Dsp(rset.getString("CONTENTIMG")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	// 안에 내용 수정하는 메소드
	public int updateBoard(Connection conn, Dsp d) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateDsp");
		
		try {
			pstmt = conn.prepareStatement(sql);//미완성된sql
			
			pstmt.setString(1, d.getDspTitle());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
		
		
		
	}



}
