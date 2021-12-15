package com.dashi.adoptReviewBoard.model.dao;

import static com.dashi.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

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

	
	public ArrayList<AdoptReview> selectReviewList(Connection conn){
		ArrayList<AdoptReview> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			// 조회결과들 뽑아서 list 담아서 변환
			while(rset.next()) {
				AdoptReview ar = new AdoptReview();
				ar.setArlistNo(rset.getString("arlist_no"));
				ar.setArTitle(rset.getString("ar_title"));
				ar.setViewCount(rset.getInt("view_count"));
				ar.setTitleImg(rset.getString("titleimg"));
				
				list.add(ar);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	public int increaseCount(Connection conn, String arlistNo) {
		// update문 => 처리된행수 => 트랜잭션처리
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, arlistNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public AdoptReview selectReview(Connection conn, String arlistNo) {
		// select문 => ResultSet (한행) => Board
		AdoptReview ar = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, arlistNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ar = new AdoptReview (rset.getString("arlist_no"),
							  rset.getString("ar_title"),
							  rset.getString("ar_content"),
							  rset.getString("nickname"),
							  rset.getString("write_date"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ar;
	}
	
	public ArrayList<Attachment> selectAttachmentList(Connection conn, String arlistNo){
		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, arlistNo);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
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
	
	
	
	
	
	
}




