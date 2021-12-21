package com.dashi.report.model.dao;

import static com.dashi.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dashi.admin.model.vo.Manager;
import com.dashi.common.model.vo.PageInfo;
import com.dashi.report.model.vo.Report;


public class ReportDao {

	private Properties prop = new Properties();
	
	public ReportDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(ReportDao.class.getResource("/db/sql/report-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}

	} //프로퍼티스 파일 연결 
	
	public int selectListCount(Connection conn) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		
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
	
	} // 총 사원수
	
	public ArrayList<Report> selectReportList(Connection conn, PageInfo pi){
		// select문 => ResultSet(여러 행) => ArrayList<Board>
		ArrayList<Report> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Report(rset.getInt("report_no")
								   , rset.getString("content_no")
								   , rset.getString("reply_no")
								   , rset.getString("reporting_mem")
								   , rset.getString("mem_id")
								   , rset.getString("report_content")
								   , rset.getString("report_date")
								   , rset.getString("report_status")
								   , rset.getInt("report_ctg")));
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
				
	} // 전체 사원 조회
	
	public int deleteReport(Connection conn, int reportNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reportNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;

	} // 신고글 삭제
	
	public Report selectReport(Connection conn, int reportNo) {
		Report r = null;
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		
		String sql = prop.getProperty("selectReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Report(rset.getInt("report_no")
							 , rset.getString("content_no")	
							 , rset.getString("reply_no")	
							 , rset.getString("reporting_mem")	
							 , rset.getString("reported_mem")	
							 , rset.getString("report_content")	
							 , rset.getString("report_date")	
							 , rset.getString("report_status")	
							 , rset.getInt("report_ctg")	
							 , rset.getInt("type_br"));
						
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return r;
		
		
	} // 수정 해야됨
	
	public ArrayList<Report> searchReport(Connection conn, Report r, String date){
		// select문 => ResultSet(여러 행) => ArrayList<Board>
		ArrayList<Report> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getTypeBR());
			pstmt.setString(2, date);
			pstmt.setString(3, r.getReportStatus());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Report(rset.getInt("report_no")
								   , rset.getString("content_no")
								   , rset.getString("reply_no")
								   , rset.getString("reporting_mem")
								   , rset.getString("mem_id")
								   , rset.getString("report_content")
								   , rset.getString("report_date")
								   , rset.getString("report_status")
								   , rset.getInt("report_ctg")));
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
				
	} // 전체 사원 조회
	
	public Report selectReviewReport(Connection conn, int reportNo) {
		Report r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reportNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
			r = new Report(rset.getInt("report_no")
					 	 , rset.getInt("report_ctg")
						 , rset.getString("content_no")
						 , rset.getString("reply_no")
						 , rset.getString("mem_id")
						 , rset.getString("report_content")
						 , rset.getString("report_date")
						 , rset.getString("report_status")
						 , rset.getString("ar_title")
						 , rset.getString("ar_content"));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return r;
		
	} // 신고 입양공고 상세보기
	
	public Report selectDSPReport(Connection conn, int reportNo) {
		Report r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDSPReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reportNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
			r = new Report(rset.getInt("report_no")
						 , rset.getString("content_no")
						 , rset.getString("mem_id")
						 , rset.getString("report_content")
						 , rset.getString("report_date")
						 , rset.getString("report_status")
						 , rset.getInt("report_ctg")
						 , rset.getString("dsp_title")
						 , rset.getString("animal_issue")
						 , rset.getString("animal_issue"));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return r;
		
	} // 신고 실종보호 상세보기
	
	public Report selectReplyReport(Connection conn, int reportNo) {
		Report r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reportNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
			r = new Report(rset.getInt("report_no")
						 , rset.getString("content_no")
						 , rset.getString("reply_no")
						 , rset.getString("mem_id")
						 , rset.getString("report_content")
						 , rset.getString("report_date")
						 , rset.getString("report_status")
						 , rset.getInt("report_ctg")
						 , rset.getString("ar_title")
						 , rset.getString("reply_content"));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return r;
		
	} // 신고 댓글 상세보기
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
